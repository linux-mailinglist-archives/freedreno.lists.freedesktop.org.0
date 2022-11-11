Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5708C62638D
	for <lists+freedreno@lfdr.de>; Fri, 11 Nov 2022 22:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5EF10E1A2;
	Fri, 11 Nov 2022 21:29:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D35F10E88F
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 21:09:00 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id g10so3718455qkl.6
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=bROYZrzq8ksP4Ro+JNVkWP32z7zm0wBccnD8PyVknkk=;
 b=nnNe6gIiX2oaJmMb0Zf+A6eMK1xh+WidduaPO1APzWsmzR/WCGTZvKoC2MFvWTC5yQ
 lzF5sfanzcorSiYUaKg0niNGR66cSg8vwCgaur30DRHNRQy0pmAfjBA9867XTLqgo2P0
 +S70VUtDTDMX7CutNc/jmMmE8OXtIhYKQvuV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bROYZrzq8ksP4Ro+JNVkWP32z7zm0wBccnD8PyVknkk=;
 b=rrYdi8qDLXVLqSCE2t/uCCmLZg1aqhdvSDUN/t3IpupW5My9Fc6A7Rnbu8hjE3JXn1
 6WbsUtWSlDNGx1AQf05Eqc3FSjb//KOKWsCInihnb73RG84uCCF7GKYoa6JK6Tclj7cI
 vJMfZWsb4oGqapxhWSWf9XENP0QG18VUDLKKQBxrH3Cywyu8n49dmhHykJ7jBZTD8Ehj
 wvwsWc1lwi3FLddjTEdfTyd0r2sDlw1pRVM3A2th/O2rK1khFbYovEYlA08itwSrW+oS
 Fs59AM+gjyzKuQiVav8kI5ioSBovN1KwzgK0u6Ac7J3pRGqQLpsDiwSXCTT4BYQ2b3rv
 3VEw==
X-Gm-Message-State: ANoB5pm3E/aS90FnDOC73EonmdS9EKvU3T/O7JW20UimAg8xLjqbh+Cg
 1Ci5ebFsFd1IDDd25lA6Sux11Q==
X-Google-Smtp-Source: AA0mqf64fIUX0YyuVZ6OqIhrI44mQQVYhld8dPGWlO9tJrLDTHPJl6XGChWD9oWvVJnXwRNZtzEcJw==
X-Received: by 2002:a37:8004:0:b0:6fa:26d8:77d with SMTP id
 b4-20020a378004000000b006fa26d8077dmr2806945qkd.354.1668200939133; 
 Fri, 11 Nov 2022 13:08:59 -0800 (PST)
Received: from smtpclient.apple (c-73-148-104-166.hsd1.va.comcast.net.
 [73.148.104.166]) by smtp.gmail.com with ESMTPSA id
 x28-20020a05620a01fc00b006ed30a8fb21sm1948568qkn.76.2022.11.11.13.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 13:08:57 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Mime-Version: 1.0 (1.0)
Date: Fri, 11 Nov 2022 16:08:56 -0500
Message-Id: <B336E259-FB18-4E16-8BC7-2117614ABE4D@joelfernandes.org>
References: <20221111194957.4046771-1-joel@joelfernandes.org>
In-Reply-To: <20221111194957.4046771-1-joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
X-Mailer: iPhone Mail (19G82)
X-Mailman-Approved-At: Fri, 11 Nov 2022 21:29:02 +0000
Subject: Re: [Freedreno] [PATCH 1/2] adreno: Shutdown the GPU properly
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



> On Nov 11, 2022, at 2:50 PM, Joel Fernandes (Google) <joel@joelfernandes.o=
rg> wrote:
>=20
> =EF=BB=BFDuring kexec on ARM device, we notice that device_shutdown() only=
 calls
> pm_runtime_force_suspend() while shutting down the GPU. This means the GPU=

> kthread is still running and further, there maybe active submits.
>=20
> This causes all kinds of issues during a kexec reboot:
>=20
> Warning from shutdown path:
>=20
> [  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_suspend+0=
x3c/0x44
> [  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> [  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
> [  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
> [  292.509905] sp : ffffffc014473bf0
> [...]
> [  292.510043] Call trace:
> [  292.510051]  adreno_runtime_suspend+0x3c/0x44
> [  292.510061]  pm_generic_runtime_suspend+0x30/0x44
> [  292.510071]  pm_runtime_force_suspend+0x54/0xc8
> [  292.510081]  adreno_shutdown+0x1c/0x28
> [  292.510090]  platform_shutdown+0x2c/0x38
> [  292.510104]  device_shutdown+0x158/0x210
> [  292.510119]  kernel_restart_prepare+0x40/0x4c
>=20
> And here from GPU kthread, an SError OOPs:
>=20
> [  192.648789]  el1h_64_error+0x7c/0x80
> [  192.648812]  el1_interrupt+0x20/0x58
> [  192.648833]  el1h_64_irq_handler+0x18/0x24
> [  192.648854]  el1h_64_irq+0x7c/0x80
> [  192.648873]  local_daif_inherit+0x10/0x18
> [  192.648900]  el1h_64_sync_handler+0x48/0xb4
> [  192.648921]  el1h_64_sync+0x7c/0x80
> [  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
> [  192.648968]  a6xx_hw_init+0x44/0xe38
> [  192.648991]  msm_gpu_hw_init+0x48/0x80
> [  192.649013]  msm_gpu_submit+0x5c/0x1a8
> [  192.649034]  msm_job_run+0xb0/0x11c
> [  192.649058]  drm_sched_main+0x170/0x434
> [  192.649086]  kthread+0x134/0x300
> [  192.649114]  ret_from_fork+0x10/0x20
>=20
> Fix by calling adreno_system_suspend() in the device_shutdown() path.
>=20
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Ross Zwisler <zwisler@kernel.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
> drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/=
msm/adreno/adreno_device.c
> index 24b489b6129a..f0cff62812c3 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -607,9 +607,12 @@ static int adreno_remove(struct platform_device *pdev=
)
>    return 0;
> }
>=20
> +static int adreno_system_suspend(struct device *dev);
> static void adreno_shutdown(struct platform_device *pdev)
> {
> -    pm_runtime_force_suspend(&pdev->dev);
> +    struct msm_gpu *gpu =3D dev_to_gpu(&pdev->dev);
> +

This local variable definition should go to patch 2/2. Will fix in v2.

Thanks,

 - Joel


> +    WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
> }
>=20
> static const struct of_device_id dt_match[] =3D {
> --=20
> 2.38.1.493.g58b659f92b-goog
>=20
