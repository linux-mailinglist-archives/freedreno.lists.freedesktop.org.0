Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66604CB221
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 23:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410610E844;
	Wed,  2 Mar 2022 22:18:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733DE10E824
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 22:18:06 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h28so2581745ila.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 14:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SRcrXrbjAkSUZ9K2sfExxRVmg7Xf9wQCXzpvkYMoGAY=;
 b=Oyp5KCl3qEk1HVjktZEALObEMHLPjVP9jdV3etdyc7CKCgn8nw1o1/0En5qILxWDz8
 DyVKpBuETJatlNRQ8owc6sjP17GGhsTSYvOKcbG9DNMfd6s09by7vrs+2jO8xnDt12dl
 CRLoD1wpV9MwyaLmOJIx7wGRSTvNTUIOUqODM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SRcrXrbjAkSUZ9K2sfExxRVmg7Xf9wQCXzpvkYMoGAY=;
 b=WNczAhDydCGkvQ9GPHu8kC/HIp42ODpVkKVnDogjPSShEsr0Ge1GXMmCPxJFOiwctS
 RuRAfx0fCldKNCJTPGh7iao/w0IPqQuXb85+jFnEAkHWEbILfJXytkoh+3RHHXdOEl7c
 wk6sqogs4hvIaiCfr/c7isg9raztbwWs3HcEfglRas8IP6THCwpFBjk8biG/+IUurY5Y
 jldQWFfj21X/TXPlhs9iA/b1JwjPeS5ahOA9C9gexyh0cnRdXrIr66665+IfTN/V8Hcx
 ri8v2xcw79BVnGD9ooiEKYXMaLgfraDBzBVVeNMeHny+ZZh/C59kRAXEr/xkOFd6v0mW
 bb8w==
X-Gm-Message-State: AOAM532v7vKRTN0EY9/OPp9R/QfIBiWV1bK8tzeGxvvMC/WXDWGAi6vh
 lNEoB0p0JmdtUY9kYV4rXoYqkHMriFFLBSgH1XMP0w==
X-Google-Smtp-Source: ABdhPJzgLW1DYN12tl3/oWDOzZVO9FPPMe5Px5umn5KctlrjVzjKjHobseggnLRnrRxg01kEcSUNt4C6vS3SRQBjxbA=
X-Received: by 2002:a05:6e02:1c09:b0:2be:8ce6:8551 with SMTP id
 l9-20020a056e021c0900b002be8ce68551mr29696582ilh.48.1646259485718; Wed, 02
 Mar 2022 14:18:05 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtRBNVJdrFYnrRC22CfXg5iVwbb+EWMqZGARO-DHagapQ@mail.gmail.com>
In-Reply-To: <CA+G9fYtRBNVJdrFYnrRC22CfXg5iVwbb+EWMqZGARO-DHagapQ@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 2 Mar 2022 14:18:36 -0800
Message-ID: <CAJs_Fx5xSDeHur+=xhQCUXfOYrNPWMpnXn79Z6yf4pHu76uhUQ@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [next] arm64: db410c: Internal error: Oops:
 96000004 - msm_gpu_pm_suspend
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
Cc: Sean Paul <sean@poorly.run>, Anders Roxell <anders.roxell@linaro.org>,
 Vinod Koul <vinod.koul@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Should be fixed by:

https://patchwork.freedesktop.org/patch/475238/?series=100448&rev=1

t-b's welcome

On Wed, Mar 2, 2022 at 12:35 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> [Please ignore this email if it is already reported]
>
> Linux next-20220302 running on Qcom db410c the following kernel crash
> reported [1].
>
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: adaedcf826dccf01b69d9a1f1997c9446c6b2c54
>   git_describe: next-20220302
>   kernel-config: https://builds.tuxbuild.com/25pJv2XjzFav5peWxwfhaU3LFEN/config
>
>
> Kernel crash:
>
>  Failed to start Entropy Daemon based on the HAVEGE algorithm
> [   12.104662] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000010
> [   12.121151]   ESR = 0x96000004
> [   12.121211]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   12.123137]   SET = 0, FnV = 0
> [   12.128687]   EA = 0, S1PTW = 0
> [   12.131464]   FSC = 0x04: level 0 translation fault
> [   12.134572] Data abort info:
> [   12.139457]   ISV = 0, ISS = 0x00000004
> [   12.142566]   CM = 0, WnR = 0
> [   12.146165] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008235d000
> [   12.149360] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
> [   12.156339] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [   12.162370] Modules linked in: videobuf2_dma_contig adv7511(+)
> crct10dif_ce qcom_wcnss_pil cec qrtr qcom_q6v5_mss qcom_camss
> snd_soc_lpass_apq8016 qcom_pil_info snd_soc_lpass_cpu rtc_pm8xxx
> videobuf2_dma_sg qcom_spmi_vadc snd_soc_msm8916_analog qcom_q6v5
> snd_soc_msm8916_digital snd_soc_apq8016_sbc snd_soc_lpass_platform
> qcom_pon v4l2_fwnode snd_soc_qcom_common qcom_spmi_temp_alarm
> qcom_sysmon qcom_vadc_common venus_core msm qcom_common v4l2_async
> qcom_glink_smem qmi_helpers v4l2_mem2mem videobuf2_memops mdt_loader
> qnoc_msm8916 gpu_sched icc_smd_rpm display_connector drm_dp_helper
> videobuf2_v4l2 drm_kms_helper qcom_stats videobuf2_common qcom_rng
> i2c_qcom_cci rpmsg_char drm socinfo rmtfs_mem fuse
> [   12.207393] CPU: 0 PID: 66 Comm: kworker/0:4 Not tainted
> 5.17.0-rc6-next-20220302 #1
> [   12.207407] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   12.207415] Workqueue: pm pm_runtime_work
> [   12.243952] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   12.247862] pc : hrtimer_active+0x14/0x80
> [   12.254628] lr : hrtimer_cancel+0x28/0x70
> [   12.258795] sp : ffff80000b423b70
> [   12.262786] x29: ffff80000b423b70 x28: 0000000000000000 x27: 0000000000000000
> [   12.266092] x26: ffff80000ad5d2e0 x25: 00000002d138d917 x24: ffff00000d8dbb80
> [   12.273210] x23: ffff00000326c010 x22: ffff00000f6b2020 x21: ffff00000f6b2000
> [   12.280328] x20: ffff00000f6b20f8 x19: ffff00000f6b2318 x18: 0000000000000000
> [   12.287447] x17: ffff800035bf3000 x16: ffff800008004000 x15: 0000000000004000
> [   12.294564] x14: 0000000000000000 x13: 0000000000000000 x12: ffff80000a8b7000
> [   12.301682] x11: 0000087facb61180 x10: 0000000000000bc0 x9 : ffff8000081d3a78
> [   12.308800] x8 : ffff000003c68000 x7 : 0000000000000018 x6 : 000000001483ced5
> [   12.315918] x5 : 00ffffffffffffff x4 : 0000000000000000 x3 : 0000000000000000
> [   12.323036] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00000f6b2318
> [   12.330156] Call trace:
> [   12.337263]  hrtimer_active+0x14/0x80
> [   12.339524]  msm_devfreq_suspend+0x30/0x60 [msm]
> [   12.343348]  msm_gpu_pm_suspend+0x44/0x144 [msm]
> [   12.348035]  adreno_suspend+0x6c/0x174 [msm]
> [   12.352634]  pm_generic_runtime_suspend+0x38/0x50
> [   12.356885]  genpd_runtime_suspend+0xb4/0x314
> [   12.361487]  __rpm_callback+0x50/0x180
> [   12.365824]  rpm_callback+0x74/0x80
> [   12.369470]  rpm_suspend+0x110/0x634
> [   12.372856]  pm_runtime_work+0xd0/0xd4
> [   12.376676]  process_one_work+0x1dc/0x450
> [   12.380235]  worker_thread+0x154/0x450
> [   12.384314]  kthread+0x100/0x110
> [   12.387959]  ret_from_fork+0x10/0x20
> [   12.391351] Code: aa1e03e9 d503201f d503233f f9401802 (b9401041)
> [   12.394913] ---[ end trace 0000000000000000 ]---
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
> [1] https://lkft.validation.linaro.org/scheduler/job/4643232#L2396
