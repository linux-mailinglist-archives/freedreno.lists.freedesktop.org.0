Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB/mHxIqp2nSfAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 19:36:02 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075A1F55E8
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 19:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8F610E8A5;
	Tue,  3 Mar 2026 18:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3+zq8+P";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BchTX2pN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E12E10E8A5
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 18:35:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623H0nRF087831
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 18:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=; b=o3
 +zq8+Pvz6Rs4uhse1bEPp2oWJBdcbNObJ6eom0YUDf8rRxo5sq2IWfz+82Pht0Kf
 T3ckTc8YDB4N//t642TC3Z63LmD4RCTl+8Zi4/T0qGhhVJzv7ApYfDfxNWazU8SK
 h/mMlBXHXdVqV/1ifU6Y1Qlky3Ku0D2C72Ccta6QTesB2qknEE9lSb66EgnoVEQw
 MiPmjcp0xLz45hDAEl7CPeZbMh40uRcUPIafIJWA75L512OI47W+VzHiIx+NQXJw
 FSI+oCu2gOex3q+fpijtauzczihunVLnEoshO05xJTnxkmng9OqvNcT0rkBb/RXm
 fo95gklPY8RUfwLLCnRQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsc13m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 18:35:58 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d4c393cc9aso32136922a34.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 10:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772562958; cv=none;
 d=google.com; s=arc-20240605;
 b=iBuTSRADuwTQ62kdA4XBHv9V0ubUNb6rnc8AZ6Cn22tw0HYT46qIs2a8acVd7AOmAa
 4ZeRtzaOxYMm/a30XKC8fj567TKZ61Cn8KPMJvkr/Pz4JKhNoiX1DiTNt6e9kKABfBpL
 /lb0IbQbEatAh/VXNp8XTek0AFLrY5X7+4rkodRU4ioctUk6fUf3juCpVnyq14ZSKSj3
 x6Au659+0NYZgRURuNm1d4YGPT8wms6uulsw7wutvkSGJjUnm9k2fmYQJ0wUnd0J97pN
 tTQWudoScahf9QINi8hGhmf9U3cCEgGYoAGdgjQwbTCeFQDrJS09YoZnYd/cUPSn+z4H
 vCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
 fh=zPmsrokpPxr0Dkcn2B/nC1WT3ysHe/BNdb4MeK2ryPo=;
 b=dn7f81AfnGbJsIvToHXn361evLMz/FpCVNP0OlLNb76NMPGG+DqJECYzvSUC3GY6Y0
 l+r9O/wBf4o7rKeJtc/ojfSP1Y3BsFKdW+JSZpwqOhMl9DRKp+pi/ULCen1pqoWbf9tm
 MwiKgF+UWGC9yckyL/Enqh9eg62YA4IkMOynqpXVzWM4zny1x3+V0Q6cxWVaWRp1bvr8
 8M6KdsyxV3RUjXVGbyD7kkBtz4ijnaOccy1+MtueTMAHL6mEVjhZQ27uf7kTf4Z7+8kH
 tfsmogr/FVOiLHMCrLD1laTUsUh6sztwTC7hvIdRQixh1BpMZ0BSW95GEh8Z2qXXh/4Q
 sVBw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772562958; x=1773167758;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
 b=BchTX2pN/1vAK7oIcn2EdvY3eTa+wIYAsq8rNvLt18+WGIwI19iDGWG2OoXlJqiM72
 wIRqsE9VhG/puEl4+NBOd8mVdi/xKq3hZ/A4jdQVAhxJI5oBDnYbzrUXlkyaaKpsuwak
 A5Mqp5or01+y90KGM8F1X19x6TAASZ+4QTCnGXkumSGSotegoh0GZUjoGzcZJ9Alj0pS
 Z1Bs94fGI3nTvAnE4RFlxVkTDyBWyDsY6PFuMHKrJ1KmByDmZKQpBD9+o8Gp9wmWqv5V
 pGown5vp0pN2TiFPX0h2862LBWeBiugoYC0+WNL5ya+MP4Y0KHNe2XVHmYIQ+PcLjOSA
 h+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772562958; x=1773167758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
 b=PsNTwyqMNtkQYAzkp1sfvez1z19/Orh1rlUFEdb7Yq7TDvYCzj8y0Kn9TWnYixltft
 5PCSwdTDIRxkw53NvtsHtQS117TdxJ5sOLfPuF1eLjzmI/GcYqKjc4nGTUdW8uZCyQHq
 rtLzlqF+crl43TIoU2AI3RV9zfgGdgQCIBWENyuh4ndHaFWRPTDHVgI0ZkrLhBBVb2i/
 ln2Y9egVlk/i8HjoBHhRaGjMdyJBCRC9MxMs4fefO1JJGyDjqYKOtCjOClS7CQUQ3nQf
 uXHnROseEbAM/JT4P3HmX88K9w1jt18FPYiXbHZ0N6FZ+OvhFbo54AWvot+p13cKmPu5
 3iGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcvgk2zP8N8vLEwWwtgMGzkSvUeDZUzKyWlYIJpUwSC98PD9tTPPiuXmCm1bLzQtkx1MQpiSFxU80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC4fBzVG+iFL1A2Wb/QKk4MeEXxywyZTAqD5Yp8ZK3QhP+3UQ7
 6gHyoasK5Lu0Xt/KVv/HbbdMEXH5ZZz0C6qnEEAPL/cK5j2F5fQJAIozIyxAKO0myHTxfCSSnP9
 NnQePTUMHBmXKyNjozGkow+ehmJPd93mJREBkN5udN0nfMdw4hyR8f4VZAUDR9qQVsmGXIOPJfD
 mxuDHDh1HvnQibFGhPn1zpzCEw25G6E2JjvZHSztoTTf/01Q==
X-Gm-Gg: ATEYQzw1M5DCg744R9RkZDQT/HGi0nNlkiSL6e1E3eMpB7heRMnrMJZliVKoRiQ9FFb
 GJJo3oCvFAZtzKQopvG7fQbbTmUdcokLXWho/oPjRsLVRtkFSW5TwgOYtC7CukIE2WQ03SUqS9o
 0BRnk/RGUlErWWNqAKJA1RNy0X60Za1TwrtU4W8TGXEyXmCBe9lnm6kLNqTX/DPPeXUY2LK9O6p
 RsTbPfZui5pnbQwfPoGrDV3grgzBObzcwAi3A==
X-Received: by 2002:a4a:db49:0:b0:67a:6db:2330 with SMTP id
 006d021491bc7-67a06db25f7mr5039359eaf.14.1772562957647; 
 Tue, 03 Mar 2026 10:35:57 -0800 (PST)
X-Received: by 2002:a4a:db49:0:b0:67a:6db:2330 with SMTP id
 006d021491bc7-67a06db25f7mr5039319eaf.14.1772562957137; Tue, 03 Mar 2026
 10:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
In-Reply-To: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:35:46 -0800
X-Gm-Features: AaiRm51LGMLCAU88Ei_EydE8BOitRPr20YiRYude_pQJj4IRN1sA3qdNhQLo5i4
Message-ID: <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kHHDsM0Zcze58ugzp7Yn4KhyhVkTX83M
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a72a0e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f9mbHagqO0joi95MoiEA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: kHHDsM0Zcze58ugzp7Yn4KhyhVkTX83M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MCBTYWx0ZWRfX/L/K5RJGaje8
 NpaxSa7pHcqZRpYWQi2td5bC6cYfL8o8UjFFLFn46gDLgOxJqM+f/+P04+5V4797TF3yL7Hu65e
 L8axXu0EyhKnAITX+yL8jBYIygDcTQB/58J+ZdrbMyBFKKouTuBzPWTBlhHk994r3+mP/nY/I/v
 oDuP7Zys+WyFlh7tXKWbbQ+CYZJVKST4iEA9P9ZdXxN7dnEEntpZmtB48KPH2z1Ir7mziwrOjD5
 JgchRJt6JwG8vtOLpa/JMzr5nOP4CnyorUaLcsp+mW6wzS8n4l6t24m/CBK0V9nX2unklbA4155
 qkXBWFeraaWBpchVzrWLLo1KG1oSfLnWwVndV2o7w0Hvr2YOb2PfnJ0wqfLWLLkSFTJa8DPvfTr
 mgp3/W1Q8mfyTymZRgKFn/Mi4J/SgXpMRtZ9LaHhp3JHTprRhup8AKCvzUEtochlRNoaKEdLf2a
 j52chzTCpi4bnxK7kxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030150
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
X-Rspamd-Queue-Id: 8075A1F55E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 12:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > On targets with multiple display subsystems, such as SA8775P, the GPU
> > binds to the first display subsystem that probes. This implicit binding
> > prevents subsequent display subsystems from probing successfully,
> > breaking multi-display support.
> >
> > Enable separate_gpu_kms by default to decouple GPU and display subsyste=
m
> > probing. This allows each display subsystem to initialize independently=
,
> > ensuring that all display subsystems are probed.
> >
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> > Depends on:
> >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c=
2dbb2638b4@oss.qualcomm.com/
> >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti=
.qualcomm.com/
>
> What exactly depends on this patchset?
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index ed2a61c66ac9..65119fb3dfa2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -54,7 +54,7 @@ static bool modeset =3D true;
> >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (defau=
lt), 0=3Ddisable)");
> >  module_param(modeset, bool, 0600);
> >
> > -static bool separate_gpu_kms;
> > +static bool separate_gpu_kms =3D true;
> >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GP=
U (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM de=
vices)");
> >  module_param(separate_gpu_kms, bool, 0400);
>
> The patch LGTM, but I'd prefer to get confirmation from Rob.

I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:

 -1: separate drm devices if there is more than one dpu or gpu,
     otherwise, single combined drm device [default]
  0: single drm device (matching up pairs of dpu and gpu if needed)
  1: separate drm devices

This way we aren't changing (or breaking) things for existing users.

BR,
-R

> BTW: have you tested it with X11? Are you still getting accelerated GPU?
>
> --
> With best wishes
> Dmitry
