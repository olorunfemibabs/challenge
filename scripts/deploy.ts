import { ethers } from 'hardhat';

async function main() {
  const Attacker = await ethers.getContractFactory('Attacker');
  const attacker = await Attacker.deploy();

  await attacker.deployed();

  attacker.exploitChallenge();
  console.log(`Challenge contract deployed to:, ${attacker.address}`);
}

  main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
