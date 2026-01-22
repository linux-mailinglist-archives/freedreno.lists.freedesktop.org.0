Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OV6Fu44cmmadwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 15:49:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071EE681F9
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 15:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C852210E9C9;
	Thu, 22 Jan 2026 14:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut1IfzMd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZ9VKsvQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D7B10E9CE
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 14:49:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M7aObB107377
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 14:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=; b=Ut
 1IfzMdvR8WqnLjFGEe91Ra1O6lHEaaAyFCgtuHq5UTCqcigk/TqXGdR47MZQt+Vc
 IhZl7T0Jgledm1PLOM4Nt0gw4NveJh5QCnuGd3IPv3x/EWBBN7NHXe2qy8XdyJOG
 1RLd9fjE5hOjGpfJif27MdaywDAZCXgYAT/KCH2kHWd4taEfCvNwZevtPHGWznHz
 LjPF6iiDGyQeb0ZEVyOvUpIxs34Mpge5JUS6x4TknR3Qs15k8pBAZgDIqYKxPvuE
 t4W/f14VmHYx5NR7+X3YPPdLoEJ03nCqfo7rviS1+jLLC9AqtBvUWenVhFOuTNjN
 22lgkZwgVIPKOoBXY0yg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgtt8u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 14:49:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b71041d135so1412980eec.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 06:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769093352; cv=none;
 d=google.com; s=arc-20240605;
 b=HMaT5aV+gVBRE93IC0qTAH9Lt8iHoVHO5um+L3myfRs/F+eZbE6HdT3ZFG3TjDWTyu
 5E4oh85tt4oTCfG5cawPFHadPTLLxTYcjUWh45X6m0WBKlNq4Jv38qzakrN60EZf6GnC
 J5RfbeLGPk0yrUxtX40Az5MigwmF0ps/OgVzlQdweuXddbLBgxfKW4LhcsZwFa3VKMw/
 5VNL1kOkOOrRVR+V3dmio+o/kfhxv5lCSc//K1JazsXizmxFl0w4Bv0nSRyva6QDa+bL
 alkH4IbW892CPUlAYXB9n0SUzkFuWlFouMUaD6tGjSWUI7sI+GgjE3AWCmobhvGAscII
 mGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
 fh=t86qcCcMxgW6otzZFAxw9ZfvCnLiRF7UjhT+WIvoVZ0=;
 b=bVNtHq8fGH+wz6ZJufm9463nHNqUTf5lfm1l4hwXn+cfIpJGgdnOwA/uMiHTdWcOn/
 FXXBoW0/emGwanOUMWlTtNf78zcFeYJkSjOxRRvtmU2i08yAS0URy68S8kC2TmTHAPVe
 nkIGP54qJ3sTtPdVxk3MT135eGPlwaegb/oZ0CGTHGXheyBIGaeh30jpGFiW3WWaQMQi
 CwOiNvCpTM2266YWIlZMLf5+rt8GlS6M8z2Hjb90ly7X67NPXCNzascJ1gsHeLD39mcj
 zfQtRgGsQW/csJS8qBVWsbDJFxKdKWjQlsr8KWl1PxdI0oxeJTnKWKog4wHC4pspV4ek
 K6WQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769093352; x=1769698152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
 b=QZ9VKsvQU9jCkFoTFPwLtMXQETJ+XvRU3tU0zq7XW5qEBodAfSfvmoQXmQ+EjJXib9
 jUmg4G0XjnOa6LMXxU2iXMF3kOXT3Y3kSBgJ0ldFXM0nKxj9XytQu/Au8/GGPimNFEz0
 TIF1gGWveGicFGuuAkuPyZtDnoOi7j2v0dVdrShXT+KnpeVB0aH/5sqcwOQRFmS0pcnm
 LSa4Xm3CFr0Q2mVbjjQ9fDTQyjdYcVs7C0FSdjPPYxCyxpIdzoGcIG/NlN5lX80PBzQB
 5EYK030qVxV0G8gX438EP2AeU+J7F9Eicl8fflmk9cifjkchvpGqNPCC6RPtKNHhS+kb
 d3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769093352; x=1769698152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
 b=wjWRwcZupVM8LbxeazPfEhxY043dk9R5xbXstVTVXqqMpgbW4bZH3l7+oXajQaYXtL
 L+zHacyfevEOIZYVJq3ZFtiV8TNS3/Khv0sEy3r9+n9DT3Bq/KRRcPQKw1CHm2qDoFnj
 FbMKltf5KjtzQQQlfRhGfF2DOXfbO74oG6Akcycj3qqtHWxVJEarvz6b4U7+a/6tc713
 Y3b4S8jmq/J/7QSjqVegIs5/e3TeD2CSJK0uSd9r0fJaCR0Xf+Fq39/1+ntX2JeOnZ7s
 zvAMNtSH9c4hmCR428JvMi6ttFLpimHaSWJAm2AiaC+dAPF/NurBnE0WjcvAvGynFPxE
 9Z5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrirfCaEeubmURkRfwZNZK9U1OnlIFjPi7rZDFaK75rr/lM4U+dqhW5umPe4vt6v8MMTOoy7YnX+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPgWxdmkaj1yopHSQFhDiCdlgozPvJMkyg4qDVFZ/zybLPPxOf
 sTvqKAe0/XNGabLJfkPGTQ5ZUq1Mg96oa9PBZ037hmoPworQb4tzWGpDruMdiGwaLAHr8TChR7X
 2YRWbODd8auZyYzEZ/dgqw9SDDWRNyZvgA7G/W7nDxpyDpSWNpJJu4Q+fkeovUnxhCrRLyhpaaH
 cbIdPVOLrfQxvfBrCZBVOgVplRGY3otPRpe4q2nsMPwMfD7g==
X-Gm-Gg: AZuq6aLCLD/1sAJEErSMcRqbg0FdmE028HxLAxbr+3MyGH9jrSwkzyhZ5u3axWvUH0q
 4MagQL/SemeMDsmOrKlm8gGAJDHR7K4m//mOfEiISdCLrB2rax26Cxd5y0oKfMYdq7PyP/65nd+
 DHfIvbijAjG/JOu9J594WcTgm//hv/SExvylvkVpmC71bxs5TjDXqMtJnZawU48teAIZV6+GbcW
 IOc5+oheSfzWBsddLxnrbUt4Q==
X-Received: by 2002:a05:7022:e1e:b0:121:d898:edae with SMTP id
 a92af1059eb24-12476b20423mr2297844c88.24.1769093350560; 
 Thu, 22 Jan 2026 06:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:e1e:b0:121:d898:edae with SMTP id
 a92af1059eb24-12476b20423mr2297823c88.24.1769093350042; Thu, 22 Jan 2026
 06:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
In-Reply-To: <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 06:48:58 -0800
X-Gm-Features: AZwV_QjkYdq6c3XPgpYIaf_pN0lJpl-wNv-t9mB4a402BGd58WCopYg5GIRuDVY
Message-ID: <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMiBTYWx0ZWRfX2ZDQe1g9f3bc
 jvni8fNuyrxPUpqlLxUDzt4XybDJNmN9ODPcWLcZOaxMs5aFmEAUT/N/AKmGB1EDthIagM4yNpG
 nSwxR9l3xqhmupCYWBpNUSZpCqJMm6flsmp83sUlv5e2iTfj7EMoiyB83p4XdfoH9qY6oYzp5zW
 xEuVo5LKldQsnVrC1FkeyccrrF1LzNIsBFDHi85gR1RablEBfhIz9hy2BpStias8oJc2lPpzCbd
 n/j3n0uSFKGYTOadfpX48H9FbTkna4BAKW02f4yadDlUq1N58Ja3s11esQFs12odAp1nIRJCI8S
 uRFxRq0hp7AYHV9jY9ADTV7OjcY9TE9iXuXJXB7hSEKxK1uhuTFoc+71PeSD5q5ezv2Yl7nYuKj
 +jA/WEVPRRBBYmfJyETtW1egYX5Sujp4ne9fQk3nRn0s2FYqEMPWA+78wHqDfjFweZYCZyHhTXV
 OhHd6ak4Q+5JqhDQgMg==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=697238e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=V1jUQ0fd79-Hst1t40gA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: AHNiPtBgysKEcj7A8mOZ1JlzTMh56LmP
X-Proofpoint-GUID: AHNiPtBgysKEcj7A8mOZ1JlzTMh56LmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220112
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 071EE681F9
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 1:41=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> [ +CC: Dave and Simona ]
>
> On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > The hw clock gating register sequence consists of register value =
pairs
> > > > > that are written to the GPU during initialisation.
> > > > >
> > > > > The a690 hwcg sequence has two GMU registers in it that used to a=
mount
> > > > > to random writes in the GPU mapping, but since commit 188db3d7fe6=
6
> > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a faul=
t as
> > > > > the updated offsets now lie outside the mapping. This in turn bre=
aks
> > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > >
> > > > > Note that the updates of these GMU registers is already taken car=
e of
> > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > > properties on a6xx too"), but for some reason these two entries w=
ere
> > > > > left in the table.
> > > > >
> > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > >
> > > > This one does not seem to have been applied yet despite fixing a
> > > > critical regression in 6.19-rc1. I guess I could have highlighted t=
hat
> > > > further by also including:
> > > >
> > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > > >
> > > > I realise some delays are expected around Christmas, but can you pl=
ease
> > > > try to get this fix to Linus now that everyone should be back again=
?
> > >
> > > I haven't received any reply so was going to send another reminder, b=
ut
> > > I noticed now that this patch was merged to the msm-next branch last
> > > week.
> > >
> > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > > cycle and I would have assumed it should have be merged to msm-fixes.
> > >
> > > (MSM) DRM works in mysterious ways, so can someone please confirm tha=
t
> > > this regression fix is heading into mainline for 6.19-final?
> >
> > Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> > kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> > But with fixes/cc tags it should be picked into 6.19.y
>
> I'm afraid that's not good enough as this is a *regression* breaking the
> display completely on machines like the X13s.
>
> Regression fixes should go to mainline this cycle since we don't
> knowingly break users' setups (and force them to debug/bisect when they
> update to 6.19 while the fix has been available since before Christmas).
>
> Can't you just send a PR with this single fix? Otherwise, perhaps Dave
> or Simona can pick up the fix directly?

Maybe someone can cherry-pick to drm-misc-fixes?

BR,
-R
