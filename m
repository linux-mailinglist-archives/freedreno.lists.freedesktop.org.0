Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2004A4BA030
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 13:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4410EB60;
	Thu, 17 Feb 2022 12:32:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834E10EB5D
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 12:32:46 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so29814657b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ywnpXw+FYV24U6JkELut8aLwZlHVlN4ozgsA3QnjwlU=;
 b=zfEBuYqlqXgQVCPU+O37vu6MDj90eOlxT+j7Y4sSkc5xB9GWNAJOUVAS0Y/6l2Rn4S
 PV3/tYKph8agacASAxrW92I9pPp4bZTo5MKsKX+Q6sA/WU910AIwSPoF4CvXOSa9M7ur
 nc10TpPHBBA0e9cgPxai0fMMPOXP6B61uLUvNGlW/BjtH3sRpRMPuYRR7fNz6/hnG0Gu
 rTgdhkYcG/kDJnv4eLPK8xLrL6HiNsMgR4OUGfjwWNYTVbvOI93HWR+yqdlWyvBPPKUv
 oKmfvcT8SUMXrCeRTFJHFs42uS2ldpMzjgiq8mgEaNkOgU+4ZUMGop1lm5tPOwpr+TPL
 v0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ywnpXw+FYV24U6JkELut8aLwZlHVlN4ozgsA3QnjwlU=;
 b=BpANgXVUdeEwXG0nVHmpYK4R2vzNdQHun14DK0cW5lHpw9oQWFXMwBzQMSkmG/1Kk0
 gkK16wofzqFi0LbxTHdisSBXg8qZXVHes2HtlcFeOdwIn1V+hRB+GhKw2/h2k81kx6NW
 qv9wqFYHVreFJSC2egSjpZ7OoJCk5ltmKxJ/1q8BWJZZgUX144I/9cy3ttZ7hk/ffHe7
 LmrEkHRLG8LMaRr7V+fqhUrOXZSozC2Z77I/3SOVar3+zbC2IHbwbsa+0NyKorQe4PaV
 F97T6UwW3We8ENnx5NS1jXmlAvk8vZoMlOGluyc//jvDwfSNFE1Ek2yNq2CBon1zgAM7
 L04g==
X-Gm-Message-State: AOAM533m0QvTym2w0uiaC6iRpKVgPI9fE5fbCr4TM/QB3eqPP8dN2fPP
 ZcL86B+piY1Pik7imtNJktYBUuEUHkQV5TLh9jQ2JA==
X-Google-Smtp-Source: ABdhPJxMPcjIoro8tE2e0XS/Kkhx0mMiNFnkSbLs+j1dHHrzmhC/rOSLQaFamMtzFi/RV7tfMa0AaYO2sfvS1G0iXnk=
X-Received: by 2002:a81:a148:0:b0:2d0:7177:5f2b with SMTP id
 y69-20020a81a148000000b002d071775f2bmr2308558ywg.182.1645101165834; Thu, 17
 Feb 2022 04:32:45 -0800 (PST)
MIME-Version: 1.0
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 17 Feb 2022 13:32:35 +0100
Message-ID: <CADYN=9L0g4yizcEM_4oXqhPphhRX6ZVD-JEm=E+=KMh-XOL8mw@mail.gmail.com>
To: robdclark@chromium.org, robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] drm/msm/gpu: Cancel idle/boost work on suspend
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 quic_abhinavk@quicinc.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi

While booting Linux mainline on arm64 qcom db410c device the following
kernel NULL pointer dereference noticed due to this commit [1]
6aa89ae1fb04 ("drm/msm/gpu: Cancel idle/boost work on suspend")

 [   17.207382] Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000010
 [   17.207755] Mem abort info:
 [   17.215915]   ESR = 0x96000004
 [   17.217903]   EC = 0x25: DABT (current EL), IL = 32 bits
 [   17.225033]   SET = 0, FnV = 0
 [   17.226501]   EA = 0, S1PTW = 0
 [   17.233147]   FSC = 0x04: level 0 translation fault
 [   17.233332] Data abort info:
 [   17.238135]   ISV = 0, ISS = 0x00000004
 [   17.240720]   CM = 0, WnR = 0
 [   17.244061] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008e7b9000
 [   17.247323] [0000000000000010] pgd=080000008e790003,
 p4d=080000008e790003, pud=080000008c2aa003, pmd=0000000000000000
 [   17.254369] Internal error: Oops: 96000004 [#1] PREEMPT SMP
 [   17.264042] Modules linked in: crct10dif_ce qcom_wcnss_pil
 adv7511(+) cec qcom_pon rtc_pm8xxx qcom_spmi_temp_alarm qcom_spmi_vadc
 qcom_vadc_common snd_soc_msm8916_digital snd_soc_msm8916_analog
 qcom_camss snd_soc_apq8016_sbc snd_soc_lpass_apq8016 snd_soc_lpass_cpu
 qcom_q6v5_mss qcom_pil_info snd_soc_lpass_platform qcom_q6v5
 snd_soc_qcom_common msm videobuf2_dma_sg qcom_sysmon venus_core
 qcom_common v4l2_fwnode qcom_rng qcom_glink_smem v4l2_async
 v4l2_mem2mem qmi_helpers qnoc_msm8916 gpu_sched mdt_loader
 videobuf2_memops qcom_stats videobuf2_v4l2 videobuf2_common
 i2c_qcom_cci display_connector icc_smd_rpm drm_kms_helper rpmsg_char
 socinfo rfkill rmtfs_mem drm qrtr fuse
 [   17.306825] CPU: 2 PID: 67 Comm: kworker/2:2 Not tainted 5.17.0-rc1 #1
 [   17.328796] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
 [   17.335137] Workqueue: pm pm_runtime_work
 [   17.341979] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 [   17.345896] pc : hrtimer_active+0x14/0x80
 [   17.352652] lr : hrtimer_cancel+0x28/0x70

 Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
 Reported-by: Anders Roxell <anders.roxell@linaro.org>

 kernel crash log links [2][3].

Cheers,
Anders
[1] https://lore.kernel.org/all/20220108180913.814448-3-robdclark@gmail.com/
[2] https://lkft.validation.linaro.org/scheduler/job/4422191#L2360
[3] https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v5.17-rc1-230-g145d9b498fc8/testrun/7713584/suite/linux-log-parser/test/check-kernel-oops-4422047/log
