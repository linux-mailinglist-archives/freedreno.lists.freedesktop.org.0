Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B21BF700B
	for <lists+freedreno@lfdr.de>; Tue, 21 Oct 2025 16:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8515D10E5F4;
	Tue, 21 Oct 2025 14:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y8ErFV1p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC8610E5FD
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 14:15:07 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42706c3b7cfso1944265f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761056106; x=1761660906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e/dqpTPnvV8iWWmqMGgRLH33p/ANKaib0nnfEtLriAI=;
 b=Y8ErFV1p2pbL8xuiDO2YFQ9yejvOejUHhlS+j/GWIjVQAHDHXj8W72xT5NNwq/nk9t
 Gi4j70gd/TKL3NuyUz6z6zVKtkUs3zyCek/NDz/onqEvY4Ojum4XW4WNtaiHsovnB+5H
 v1zn9M0iMMSFqbtMHHMdmAMwAfvmR3RJp8CfwC875MJ80BXbA8RTaLQuXIRX4rSljeL0
 QY72J6EWMzSonHn/k8sL62W4qI5BKrKSFkdhe2PlKZtMpTgb7v4/iq1gVfk4kzWt7Ogh
 6f0v3ekyCfySodIvoZQlsPHZg9Z32svZT/rpUaM3Tvvq7kO4GgvWW1rXjSJCa/Um9GMO
 lqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761056106; x=1761660906;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/dqpTPnvV8iWWmqMGgRLH33p/ANKaib0nnfEtLriAI=;
 b=PIxRmRhMEIU/Ctk61CpfxAqe1MCBTZoAkDZdWgs1FUDJXJmiHTS6bZSAh+oSmZ49E/
 gz4VSRjBdQROG9bPvvD1AxdjZts3xnm5xrJBiGMX8Fc+VOCefuur6+7pzycagR/5NJVx
 fKrwvJRxWfKU9aBUS3BJvtWK0qIs5FeuR/xVbPMBTOH714XGxIa/HQupI8CnpOt4YNHz
 VyQg1BfpPdViPm4e4BbM6hd43qjtgTh3gHxu1Djn0SRLOg3Qtf3CIVB93G4nqfQMA/jc
 6ysqsNaLH23wRZogFPEeklq/i5ilH6w1vgwSqImmwnpqGmLbGG6T82rckH8FBzqQrGsG
 hCMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/KyvS3RplWK7uYIWnElksITTqfTkxPYWIJuc9vM9Xh8BH1lCwsZ/aQ96jgCGAwVWM60ranOpRxmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsrbiTQX6abN2wpcawlbs9pP07wi99iwbCiYb2bKqUALV1Tb2a
 MZfSnRKQiMZm7qdolpFu0DseJjLkvf07Ol3QOVFdkCJzqrqJwa974iMWM0VF2USp8qYOsEGRmQE
 0npNX
X-Gm-Gg: ASbGncs7TMLDd1qDrC4RSowL351+cQpC9cuNJwYOLl8b63MIRxS5V22MTBE9dUQRQQh
 hIwKmoKGp7W8SDDXLO9O9cNN/k0fuKtlg8mnB3YMcEbTG/AhBc/+fI4C6fsOaPW/SkMECTQe8Vr
 h/FAkf20E2Mr1j5I8yiw/7cohPCR3/XVpOUZG7DhFwX2bC/8WtNafjFBPuulDVgy6c6UjrM1D/7
 6+ep/GojzCKBUzlbKO/IIKLxEK1itaM6XNntiGzd5r1s8NVzz+XaiWDqgW36JEuFYBNgeTB/tCt
 e520n6q0hFmcXXNr94JTdn8NMiDQWUdwwUIXvCez/wq5wvDSzUZugwOW7mwfZs0W389OapuiYUM
 DBRSwBpcs2g60GD0/CjKnO+MBtQzd6gfOAqvIX/8SLsk4i4h/QFsImbT0ebCo6DSl6QV3NnKe5g
 mj0s/5hnPBhFB5VP1W
X-Google-Smtp-Source: AGHT+IHCNZ/tdeM6x90rsmi2VCTmRefM5mCM/ZgV62wABJXCvN9MGq3+VgVSrxQSIurd14j6LlHgGg==
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id
 ffacd0b85a97d-42704d74f9fmr10437179f8f.18.1761056106262; 
 Tue, 21 Oct 2025 07:15:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-427f00ce3e2sm20554878f8f.47.2025.10.21.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 07:15:05 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:15:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
Message-ID: <202510212140.4YWihsB7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Akhil,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-a6xx-Add-support-for-Adreno-612/20251018-011020
base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
patch link:    https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-1-0baa44f80905%40oss.qualcomm.com
patch subject: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
config: powerpc-randconfig-r073-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212140.4YWihsB7-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510212140.4YWihsB7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a6xx_gpu.c:641 a6xx_set_hwcg() error: uninitialized symbol 'cgc_hyst'.

vim +/cgc_hyst +641 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  600  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  601  {
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  602  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  603  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  604  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  605  	const struct adreno_reglist *reg;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  606  	unsigned int i;
40c297eb245b1c9 Konrad Dybcio  2024-08-28  607  	u32 cgc_delay, cgc_hyst;
51682bc4abf4b55 Konrad Dybcio  2024-08-28  608  	u32 val, clock_cntl_on;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  609  
dff2f69f3e8a6ea Rob Clark      2024-06-18  610  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  611  		return;
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  612  
66ffb9150b00f3f Jonathan Marek 2020-07-10  613  	if (adreno_is_a630(adreno_gpu))
66ffb9150b00f3f Jonathan Marek 2020-07-10  614  		clock_cntl_on = 0x8aa8aa02;
5cb9695ccef2305 Jie Zhang      2025-10-17  615  	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
e7fc9398e608a7b Konrad Dybcio  2023-06-16  616  		clock_cntl_on = 0xaaa8aa82;
18397519cb62248 Konrad Dybcio  2024-02-23  617  	else if (adreno_is_a702(adreno_gpu))
18397519cb62248 Konrad Dybcio  2024-02-23  618  		clock_cntl_on = 0xaaaaaa82;
66ffb9150b00f3f Jonathan Marek 2020-07-10  619  	else
66ffb9150b00f3f Jonathan Marek 2020-07-10  620  		clock_cntl_on = 0x8aa8aa82;
66ffb9150b00f3f Jonathan Marek 2020-07-10  621  
5cb9695ccef2305 Jie Zhang      2025-10-17  622  	if (adreno_is_a612(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  623  		cgc_delay = 0x11;
5cb9695ccef2305 Jie Zhang      2025-10-17  624  	else if (adreno_is_a615_family(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  625  		cgc_delay = 0x111;
5cb9695ccef2305 Jie Zhang      2025-10-17  626  	else
5cb9695ccef2305 Jie Zhang      2025-10-17  627  		cgc_delay = 0x10111;
5cb9695ccef2305 Jie Zhang      2025-10-17  628  
5cb9695ccef2305 Jie Zhang      2025-10-17  629  	if (adreno_is_a612(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  630  		cgc_hyst = 0x55;

Only initialized here and not on other paths.

5cb9695ccef2305 Jie Zhang      2025-10-17  631  	else if (adreno_is_a615_family(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  632  		cgc_delay = 0x555;
5cb9695ccef2305 Jie Zhang      2025-10-17  633  	else
5cb9695ccef2305 Jie Zhang      2025-10-17  634  		cgc_delay = 0x5555;
40c297eb245b1c9 Konrad Dybcio  2024-08-28  635  
af66706accdf5af Konrad Dybcio  2023-09-25  636  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
51682bc4abf4b55 Konrad Dybcio  2024-08-28  637  			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
af66706accdf5af Konrad Dybcio  2023-09-25  638  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
40c297eb245b1c9 Konrad Dybcio  2024-08-28  639  			state ? cgc_delay : 0);
af66706accdf5af Konrad Dybcio  2023-09-25  640  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
40c297eb245b1c9 Konrad Dybcio  2024-08-28 @641  			state ? cgc_hyst : 0);
                                                                                ^^^^^^^^
Uninitialized

af66706accdf5af Konrad Dybcio  2023-09-25  642  
dff2f69f3e8a6ea Rob Clark      2024-06-18  643  	if (!adreno_gpu->info->a6xx->hwcg) {
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  644  		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

