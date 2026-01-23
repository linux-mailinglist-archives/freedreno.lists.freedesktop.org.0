Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ShwUOdPSdGnl+AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 15:10:27 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8920C7DC3B
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 15:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C363F10E335;
	Sat, 24 Jan 2026 14:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PwbITEmW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726210E137
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 19:03:48 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-34c363eb612so1481294a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 11:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769195028; cv=none;
 d=google.com; s=arc-20240605;
 b=j9jOrpakL0VuhTCOsKi6R5xgD+gWE0Pcfa60Trg15FSbrtY1rDyQur2vH1rbUSw2GE
 U0XxSNZzqzqKvoQOvVdpfmP/66zkLrI0Y4HPL1Bd11168T2iLflODiUmKT13fUbPFkbO
 wCMpJKtH66rQkAq7uSVay9J2R5rj01jfwJHLn9y5oPN9bSxzGHKYWvJRu91l1rPm58u7
 yVaotYjdFK8zl0lFaKMHpSpUTzFtyYsA+y90cQWQ7K8sapxibko0IeGO82la2Q4VHvy6
 CUi3MyVqzw/qDFf/mNeB1cnf5MC+4h2sILCjsgItATqKGbHzw5zuL0/Q2BO3EeNS5fk5
 gfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
 fh=V3fGo6+W37x+lNcqFEgJ5NvvQd8+kL1UEZ2q6TKPTOk=;
 b=C1/jBOokBEsO6B1AOKbjAt9LhwzwtTuSqIZievOrGoyeX9lEhqn973famVIxuNKQVg
 jpmIVBEd5IRtOLDQPL7bF8nJavYhRAQRSD0TjwyoASSwSobaotd1XKlutNqxvCmP3N+e
 iSl+nRxC+/rj8JbZmPj+gmL9Ev92YmfDY/eV3u6Lsz4uitXpT2zbuh+9xSO71Aod6y/P
 SLmFHM3AeCJih7hNg/PV/u7cuwuJSo+mz7INkr4yG1gBR3r7h9M251AULaKFTtqCSpzw
 +8YRV0XTq8IKmNkI9EBf4Npujwy9sxTeMwo6x2s9VYm6qENCfg20R7XqCLKDw8+PchMf
 zl0g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769195028; x=1769799828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
 b=PwbITEmW7HwS61Xd7rf7r64lotRti9vN5N3Pgjz4yzkeeK/7ssE/Y+ns1ILa9LyD3F
 A/4qR1ml7FLwb5XCTWq1GNHfKOr5jlg1c8XNqZEwcm5QxM+o1kJJlaLPupTdpVDwdX+G
 cMcYnHNkfwHivseoEmuIcntP0Qrq7IJSRxisax/301OthEAUnAKS7xtFC0bczOTjEP+w
 qe2spXYr3bb5P4ylKECHwYsYAH9FqjU16PteHzy/fNJGhnq0LmEA4KjZZZcVVkZfovMD
 d7y1ZZAjv9qWK6hMIhIZkLuSTeZetomzgJzt7Jn1AyWmV1HzYhDO6qJw6ndKuwVdjWKt
 2kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769195028; x=1769799828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
 b=IhWSwLzG/KxdNfUOPVxh3I/QDnK712XoBxVLMmr+tEJibEi2tPhdm75X75gy2LgEWc
 QOuSnr1UXNhwLNaagAEPHY6i6Alq2CX7Qfr8zH/Ech0hAgyocVeTDvqQnK6w94H3+WZh
 Bc3Yd1/78aQKVgcSy6cDyqVtLmt4iwpmXP6s2sMjVf/cWbxGB8zssFg0H8ibIhgTueI6
 i0d03A+eqUpYc8GDt6XoWz03E0PoeGYQs36xiL/p1xDTvuKSigRwx0rKaF18s8+tokmM
 Hr8GGYjObAgdoUIYisEmoHvxq9/7zdNU8lKAjkpPLP6euudyZeep7e9OADnpS+Bv/Pdj
 OYhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8qPSNPII5qS2kwF5xJaGUKna84YUfhp4hxNSpiXQw/+mBImqC3Wo6ulsjdG747OcNRGReJ6/ul3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxEebBeUBnb9ga8NT9gkP/tvMY7GOum4fFf8ulmkhNMKNHI/E6
 I3e7wZ8MgsdihNlZm/lbLs5sQjf/uEcPcFlw8SwZVmkqUa8XNcB8iuJ7spwkClHJx32PJcOrqph
 3WKbPufSQGpfI9x+3DK5CsvOTeaduM3k=
X-Gm-Gg: AZuq6aJeO+2CJ3D+YVJ8sUCwl822TirEGs9xg2kQ11qtYxScp3jmACaH+3wVi38MM+E
 3+1pfH8uzh+usPFr3tTu7IJenDXOu6xb0xKYt+GHrOzFxZnwy/q/sRLwI8eZm5qduRDO+3wfrIa
 hU7Ykpc7Rjzmojv2Hq/rbxCbCATsqB3B18G41t/nqolrrpHYoxocr6uP5flmIn5ZNTppBmDi8TE
 I0I277/TArP14oG4uTKnt4Ic7p72VdJxE+33THDqKFqTf6peQFhnxDeZQnzDhz3mts5IYzeKI5f
 Kwilq/9/siUVOBt7zyzbxppvBDKqeOf6XVvj6Kmu
X-Received: by 2002:a17:90b:35cf:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-3536940db8fmr3166428a91.34.1769195027943; Fri, 23 Jan 2026
 11:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
 <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
 <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
In-Reply-To: <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 03:03:36 +0800
X-Gm-Features: AZwV_QivjQ34-CL7g8z5Ds3bC6eKMP2w7Yc-5ipaWGaKWB4sFP-reRfInpFIWaU
Message-ID: <CAN4SLj2QtbSGG6h+iwEFjNat=5xZxjF9r4GRmfePz=tYGkjGMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 24 Jan 2026 14:10:24 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 8920C7DC3B
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 2:23=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 23/01/2026 20:21, Felix Gu wrote:
> > Hi Dmitry,
> > Thanks for your review.
> > linux/cleanup.h is included in linux/of.h.
> > So it should be included already.
>
> Yes. However we should not depend on include files being provided by
> other kernel-wide includes.
Understood, I will send out V2 to fix it.
>
> Also, please don't top-post when replying to the emails on public MLs.
Sorry for that, thanks for coaching.

Best regards,
Felix Gu

>
> >
> > Best regards,
> > Feix Gu
> >
> > On Sat, Jan 24, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> >>> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> >>> While there was a manual of_node_put() at the end of the
> >>> common path, several early error returns would bypass this call,
> >>> resulting in a reference leak.
> >>> Fix this by using the __free(device_node) cleanup handler to
> >>> release the reference when the variable goes out of scope.
> >>>
> >>> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> >>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >>>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 2129d230a92b..0bc518d9fd65 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>        struct msm_drm_private *priv =3D dev->dev_private;
> >>>        struct platform_device *pdev =3D priv->gpu_pdev;
> >>>        struct adreno_platform_config *config =3D pdev->dev.platform_d=
ata;
> >>> -     struct device_node *node;
> >>>        struct a6xx_gpu *a6xx_gpu;
> >>>        struct adreno_gpu *adreno_gpu;
> >>>        struct msm_gpu *gpu;
> >>> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>        adreno_gpu->registers =3D NULL;
> >>>
> >>>        /* Check if there is a GMU phandle and set it up */
> >>> -     node =3D of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> >>> +     struct device_node *node __free(device_node) =3D
> >>> +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> >>
> >> Missing include for cleanup.h.
> >>
> >>>        /* FIXME: How do we gracefully handle this? */
> >>>        BUG_ON(!node);
> >>>
> >>> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>                ret =3D a6xx_gmu_wrapper_init(a6xx_gpu, node);
> >>>        else
> >>>                ret =3D a6xx_gmu_init(a6xx_gpu, node);
> >>> -     of_node_put(node);
> >>>        if (ret) {
> >>>                a6xx_destroy(&(a6xx_gpu->base.base));
> >>>                return ERR_PTR(ret);
> >>>
> >>> ---
> >>> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> >>> change-id: 20260123-a6xx_gpu-cbc095dbe423
> >>>
> >>> Best regards,
> >>> --
> >>> Felix Gu <ustc.gu@gmail.com>
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry
