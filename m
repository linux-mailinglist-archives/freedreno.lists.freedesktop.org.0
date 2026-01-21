Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGLaLmcKcWmPcQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 18:18:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7245A6BD
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 18:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C1F10E861;
	Wed, 21 Jan 2026 17:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbjF8wXn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IENsHxr9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D5410E858
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:18:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LAeKrL2816882
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=; b=Nb
 jF8wXn8ZSgygBsmTdbpBl40vKFHg8dkPGWRKzz6ucnKEoqGHP1UGG9C2dTdL9t0p
 mnmNhkKJTjYQz37b6VQiTjuvANKCXesbGsQ2x4h38XYd8ZHbcBNIcFMm5MpmaeX/
 y26490F+F+YMxAXpn0rLo3Z6HYpISsOiOjuNr1NUq8SZIPzrZaRSrLzDNsLEvK7X
 C9dkGRbzuXSygbTNOYMLC4Sj89Rn43lwFHPbf/Hh+ypZlGbUtCLGQ32FFpegZjZX
 JUPmK1KuNHt9plNndYvaFm3iQyyGTENEbZsnBBIV9HkyfVwJFL/YkO0QBEHyo9Qg
 TmFMF3zjs82TdliaiCgw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btw8khd4p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:18:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-124627fc58dso169526c88.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769015907; cv=none;
 d=google.com; s=arc-20240605;
 b=dSy9PpMsicPNn/xzTBMRRjSnSOTdbLCXTyaQlAwEqpO3DB8UpqCcXT9uuCILoW4amx
 wVFDeYwHHA+3Z6TN7Wkfyrs7OaeXFN1SsUg4Iyy+wi5v+ZQhlRpb8UfKIS5GXQ+IleDJ
 NAppPhBviHe1aJnD+L+G2HFlQjGHeMCq4aZDXxbYjLXuIjpEHUcXhJnwrusdRM1xPzzs
 H4e+eUFDnO9w3fI2fHI9wWW4NHHOeVWI0q4YrxuEm7ZBUlsdbYudFKqnPDaAX4s/DwsG
 FYjttloEqgZYFwVnp+T/fpRvhiTsi5lix9lxpSvYZEpSOjXgcm4S6UC/kqMpVXOAR7oc
 o4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
 fh=E0nRB7gKSW/DKurYD/YG+5ZuARWAJfyFxfcsoppKJZc=;
 b=ctWQLZ5NFdaD7SFLg9HF7Pmhr71cgXYUDpg2TQrdNrOAcjUDQWAs9VeZAHKnk0Pk/5
 zGttzIGfY5p7Y88idRF9oCtHbgv6QA5eAZ/fcg1GFOJlboSyD4mYh+IMeRBZcD1POsIS
 ypvhBW3c+YXKfYL9yWKpxj9Iset4iowAgzg7JKQ6juHMv2UBheYprBKaplqJEDQexORP
 ehlnW9jUMhLfXASGWhwb7R5eWls/9hG/mqRSW3V4UIuKCprjLs2mfOKIXjHHNH0o8bZa
 w8N8ZqrrBsOxA0mvXLB9vxBnPfkScm2KZWiKb+gcSJvs8dnQW3Y9BUThdt1gbfLGPhzV
 /9UQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769015907; x=1769620707;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
 b=IENsHxr94jmswhNsLQ7ppm4mldWMWrrVXYLIr89XKovKklSpGlKmnvAzy1bsqr7/ps
 +W4r28LhcPjA9O2MLUuWGRj0S0RD12A+wIRHzw5JExQ4RNFQkTVp2zyfy1xpfSDOQXgl
 5xEcrav2wgQxKy6r2X4C1QoB51AHOliTnVKPh7LDNwHb75ZH1lyyDNeQIeQx4i3OU906
 fptrcjbTpsdwD8I8Z27d/ZUHk7QokI1efLKhWkjTvJBkv5gU1Y/6epRV3yWiKzy6bs/H
 79dmLCrd5p7fOW8CeYAut1jbJmtJY7Ne6o1nthq6JncMjzuqsPfTlv8Ei+A3/ZYG4UrB
 vEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769015907; x=1769620707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
 b=ZGdF0G/f/zIVXhVuJMRB91Ov/Bv540ahRtIybSgKdnb+h9sAx8DeC6TGjhD0k3CSn5
 OsfPtTEvM016cY4vDRQxYMJxbfyq8oxc2LMku9GquYNO+1t6TmHDwHMhF+L44vz2LeaP
 9Q/7CfwoXlZhCVwGSG/RlGoY0/bwnNPalB0xdi4QLwZDf3VvWLkB+Hz4EFp2/zB8hyn6
 g1EqkjQS/5dyJmBBmr7klOSvX0GQxVe5UkXBZXkSdtu4q+hiWHs8qhE1sOSYaxPUhILf
 nn/+p+CZzgvod1KbPAa4EPiWkel7pMBHKLjCiUkhU/eXcnP7nw68eXfr8CcwOqA9ZCUT
 Vo7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqZBpMGZuAAjxrwFJeuhOr1yHZx5scyNvf1SOoNSNy5MU+Tr1V+EvkKrLHe+Jl3JMPdbU2TcsQXUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRObl+Kde7oTiBaxh/vCOoXFiJJd2UtJgTl+8dMUBZkvDqqSip
 J4Sz1PfpVBQBnTBKrt0Cbt1kwUNf+sZWsasm21TcMgp+CptG/2KIg8+SAhITzIjCm/N3mXB8AWL
 y1H6ZKURSLH/MWshUNr3KU7iQUQk/NtBt7ECR73EbDJagRBNUwXdtSBUG4malVbpVYe92rGNu8w
 BGSiLHa14SL57Gp3v3vKPC+Y18WZ6uQMz/6o4vVn0mnbwPoA==
X-Gm-Gg: AZuq6aKa4+QFX8C3n7+46tuytQaLx2oSW+IDwTFN+MQLT4QL6AfaaP+y9W1ScIvKExU
 WYWRci18049UpVECCkeN9Nox3nHBgNh3AccGp9dJ5xa775aTj/2HHGE4s9zk+e4Sc6PV8ngB4MG
 OCWtMtYLxTUzCXEFSOQ4MyECNQ5BQyBM9LI7N5qZZnldf1VTYzNJaI+pQu80hPut8oR1ma3GqO9
 aMFOP12i5WfyTKiypFEozLwRg==
X-Received: by 2002:a05:7022:6b92:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-1246aab32f3mr3214501c88.30.1769015907017; 
 Wed, 21 Jan 2026 09:18:27 -0800 (PST)
X-Received: by 2002:a05:7022:6b92:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-1246aab32f3mr3214481c88.30.1769015905900; Wed, 21 Jan 2026
 09:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 09:18:14 -0800
X-Gm-Features: AZwV_QggMC0EGXfDHD9Ynlotejfb84ZLpeoJQeG0wdpRQPgq3KVidg_TyOdspLM
Message-ID: <CACSVV03QHtWNrmvySkf1GdkfJ-iC=zFWf4OYrK1E3oq2S9bzqg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Federico Amedeo Izzo <federico@izzo.pro>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0NSBTYWx0ZWRfX8n5I9cRX4ZcH
 PlzvG4ZTemLL17gELjGBukDiyuPF5dwedxaLDZiipG1OT5uoCcFeq6vwBdB7eh3Q7CdKfe1037/
 BF+pluDtjt+L6Tkr0GRg4SXHA+Gvcy7AYGntTS7B7Xz4njwwKuX00wKNv/bUfEhsWdtByBfHUj/
 YS5zwAPEgQgxdjaeoTE66otaIVa4v7taYcPXLNQ/UMlB5aCmHM6V/8Orr5vHuj+zeLWr1HsxcUT
 Nv3M2FePSVwp7XOLS2XhvGUhi4kF8faRD81lEXxgkNe6jYVH4rdCvXGTjr30b/Hv3oKKuiJGxvZ
 NLnlaTgfsWBrOvZfEMNBDOF5MkBBKl3Gg7JkXmb3He4f33z/dgzM25ukyDX20ww9sGXBocdDmIq
 dFgzTKbh8fGLOIL89O6yi4+fBsZNudImJKHFuT2UREmHdzFhTj+GpCrfrR5vcwzK7IVwYr8wm6Q
 PvIZ6uO3LDxK6121stw==
X-Proofpoint-GUID: 3i_Bibka91hnstESj6Eku-egLPr-cDmY
X-Authority-Analysis: v=2.4 cv=BPW+bVQG c=1 sm=1 tr=0 ts=69710a63 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=oiMQHesyWy8z1qx9V5wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 3i_Bibka91hnstESj6Eku-egLPr-cDmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210145
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro,vger.kernel.org,lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 6F7245A6BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is the fix for the IGT failures reported with [1] applied. See the
> pipeline at [2] and [3].
>
> [1] https://lore.kernel.org/all/20251019-dpu-add-dspp-gc-driver-v3-1-8404=
91934e56@izzo.pro/
> [2] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587979
> [3] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587942
> ---
>  drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | =
4 ++++
>  drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | =
4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fail=
s.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index e4a8f8352cd6..ae36a39619c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
>  kms_color@ctm-negative,Fail
>  kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail

It is nice to see a comment in xfails about the reason

And maybe this should be squashed into [1]?

BR,
-R

>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-=
fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fai=
ls.txt
> index e4a8f8352cd6..ae36a39619c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.t=
xt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.t=
xt
> @@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
>  kms_color@ctm-negative,Fail
>  kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>
> ---
> base-commit: f185076da44c774241a16a82a7773ece3c1c607b
> change-id: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
> prerequisite-change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770:v3
> prerequisite-patch-id: 7a52c31208202effb5cc4b7aaf6d6a75eb9a258d
>
> Best regards,
> --
> With best wishes
> Dmitry
>
