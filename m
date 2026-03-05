Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OSDGESbqWnGAwEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 16:03:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1F2141AA
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 16:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120210E2B7;
	Thu,  5 Mar 2026 15:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8gCH7L4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNujCt/h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601310EBF7
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 15:03:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFu7w1517997
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 15:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=; b=Y8
 gCH7L45JWn/HjUc3BfuZ9xnEPbncSbpCEdBBjfN8kz14pSFI9Ua8RSKa4uroPCia
 PELpbRGQWV7h6iHPXi7JLlZwMM7OhoK4fdFUcpfLIbbqJtnoq5kgB1egGrTAKDOj
 dtn/1Fn7KWd5nDw3GNKUanXvI4KY9Hun50QtRkPBTZjKqysRQ+AP4YdnU4gLHcbn
 NjO3CPzLB5dDCWX1gQXLAdSC+a7v7zOnltxSMLJuEpmRtUrWdeAxc+NzYiI6bn2u
 0Owkiq/gP7WhCIYmVVtYgToFGomlvbj+ZTDYM0linp54IJAD4/Mu/lyGz+CPUVtS
 7DNERbpmRU4ziL+rHbFw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptk6hv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 15:03:27 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-6798921eff4so103296860eaf.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 07:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723006; cv=none;
 d=google.com; s=arc-20240605;
 b=M8iYa4vI+18rNh2XtvvlrgIQOdnJwKY9jvn7whEL2hSWEZ0J/dHqsgOQY3lSXJ2iSs
 3b9niH76UCjQWIhMYVtaF6ZyJvYO3Qp7e/7Loch1Xx2JBsxDwyV1MO2ReBt46EPffsuh
 eSa8VH0x4/XoSl8gfGEDs3dLLvzoGVyIA7YNXIAWbaeDDYs4SfCBu2WhFIJdM8O6fCg5
 dee2PvNLAVqg/LKdbhDC3zjzkzzJmMvcjHDInLbpikaK/XoaEzhPoLPSx42zlDoEUvol
 TIkYXBmqyu5EjFMbRTo4mubCVyhhwN0ou2V3jafPc+VRGde1BnyrCjtKDMk4dAm+qTR8
 GxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
 fh=hRgpAd4u1CcmjpdSyrktabKITSTGnLfZFADcCu3FYRM=;
 b=TGKwD0K0to7XpLLXnwM/qEuPc5kAPp+Z06+XU2upu/oIlvoh51gDxryXkZQI7p9GOq
 08OBLya84cxLmhGW122obaCTuDYFZULMFfN+csINeLfF3uZyrQ03NPrOsbP8ijy8xbHB
 dF5NOtRy77Dd38CLabfnED1qdg49u5Cszs9rllb1B0WbZhkHqENWxI/ZCaEXf98JaamR
 JvBuuioWcSUgyP76N7/I00YCrpwMYOUaPttkmPAld1jpAtanzqegyRNngtjfL8988cd5
 GJWji9xByINg7l/5G+vum+MIp/3AaxEgLmNbDYngz4j5k6h51dyk4eQpoUGpVGK4Zt9F
 CwQA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772723006; x=1773327806;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
 b=ZNujCt/hKzAtJ5ifw5tOmAbs7/WA5OUxz2yNHrOseQBhO6MLAGGH+UquamZwc2msV6
 rjD227FCyz2LqZTROJftX+gq/zSJxpVOcqRpnNTQAXLHyiMnCo9jcdDk1aLphBphErG5
 jVMKAfSOHBt6tALufcs/hepk5aUfLJ7oRD6n1SXFtwmgSuY+iHpeycMD/33LhGz0uBIN
 ByRbnNmSWz1Vb7OQLIC5rWiLAVZSp63oFI9Ni/XPlOJBSdd1Jy4ieBfAzTzOTCu27wZO
 7M2fIt+FVY+Ba7bPuep+o6waI3FGDZKZqucN1ibu8W6VtRzq7QZxUmosm5Ht0M7UU0sC
 H+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772723006; x=1773327806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
 b=pfBsTAan+n28krq6+CDDke4CWoMQrxXNxuikW7+k0iRhH85m/0sppLc2QUMX4ZNEWG
 J3obCqxxZjeb4TK79iYukdqp7zYiyL5vK1fX2pqYvVmJ9fFEoFAIY2GOaN9+o8yrGouc
 opHdBDXW2F6+xq1QRwAVbHMfryKEDWXOM3E3n3Mvwi7C5juM2vMklakuG1BNY0LK6KVY
 raBYu6qBNLABgzxm2cfgQsWDp/RCxsUk3A7Nn+no6dkq3U7gUnVOjZRBT/ju2z0B0bro
 9zjIGAO9xYhWXjH7uWrCPcthyMwvfc9hjrleZzDMIQ2gd0M9b4RocjvsKSD64goCT+gq
 f7dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0PD7rcpCGU2jco7V7+/JFY32cEfka9EZKtjHloSmQgODMdD/QqH8Qwe99n62IEYUPUwUMv8h4QxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFkoiEdSmKP87T55FfwUZ45Un8FnN4dcLKYIVKEzCQtBzEXNf7
 x+r5Ez32enNDTyJcYiFgeabMXL1ygXF8L2prUo14UpdnO26zUN4kCOyiTB7ayeOIGyHAuS11PUU
 QW12tkRnv8zTxuf4PgzNTKfPzuW7zFeVp9JG+4cQIc7TBS3YV9UeDCWxD6y2kApxiosVfDb8inj
 IAGB31lgGNRd0s0m+tGhDUMlHuFpurnJuwhO+XBf2PW2HrQQ==
X-Gm-Gg: ATEYQzwQ+cz1lGOsUhUh+LAQCytAUdCVnkGE1tMpJfhwYqgtcb2KTN+vTg2heUf6/V+
 quLzUZ72uQFLvrdMrLt4sKY6Ul/ZT7dWqyAhErh4WTOiufD0MVIXMwoeeykFCyMOf/BF5lVd10a
 obMtdlOpvrtUT/IkzWnbnMrYLEUb4F4acfZYxAawA0LbnNeKxS1ffR/NwEAE1Jx48bq9ACOYmJD
 WyJ/N2MHeYFGeOE/6iGfgDdpKS+t62BPCUKlw==
X-Received: by 2002:a05:6820:208a:b0:659:9a49:8f9a with SMTP id
 006d021491bc7-67b176f9f67mr3931566eaf.19.1772723006312; 
 Thu, 05 Mar 2026 07:03:26 -0800 (PST)
X-Received: by 2002:a05:6820:208a:b0:659:9a49:8f9a with SMTP id
 006d021491bc7-67b176f9f67mr3931529eaf.19.1772723005755; Thu, 05 Mar 2026
 07:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
 <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
 <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
In-Reply-To: <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 07:03:14 -0800
X-Gm-Features: AaiRm51bDhvB43EfwoxoSRnaOyoFThqhuUzYzZWYldhnSsTl3epiIJCXPrkywEM
Message-ID: <CACSVV02U1+or3yo5biOZ6imkkoExNPeDCmgEUWKc04ObbsikuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyMCBTYWx0ZWRfXwWt1n98Q1kpt
 ersqemhChVM0Zy1MUPPdsv0c+uH7WNNCph/IgJ3fhl3C0iKjP4qmbPUENJwkN7XW6a892i7+BG+
 tN4cR0+gQ9BmAqCxVvIM5XW4pm1qNqTB5YGlBSdgm5PWNu4hILW/DN02dpPJTfmDV++WqZ3AYBT
 t5EOIlNyDobsJOj/Vk6d//aELmzFiFuUgopgQxzY9j7fIYw5G9UxKglHGQD2qzCN6Q+UZBrmIoy
 xCFNY9j6fvvS1cO45BANL08xlR71PBay+nB0onndQ2cVbUGsCXTpoEfG7uc4F7bHNSqOn9Vti2i
 nsfrttHJ7rYlsS3p9L+ANlL/PO8YLM6oefIoGCBhiWqL0keOR9+c53ztxB54ZfKRTxk1gopdPaL
 +XzFNAigYGDzQ/nDv56pBxSvkOQItLxA9BOo/x2yH5lz6KDw2hMV3YBL/2kfqh7aV4jg98LWDKB
 ryk3oSt00XJMONb7wcw==
X-Proofpoint-ORIG-GUID: IA_FHw0aKjS3oIfKlpOSsIG92jv47Avg
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a99b3f cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=ASjFhuaS4dzjz75NzcQA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: IA_FHw0aKjS3oIfKlpOSsIG92jv47Avg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050120
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
X-Rspamd-Queue-Id: 90F1F2141AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[freedreno];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 5:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Mar 04, 2026 at 06:59:42AM -0800, Rob Clark wrote:
> > On Wed, Mar 4, 2026 at 6:57=E2=80=AFAM Rob Clark <rob.clark@oss.qualcom=
m.com> wrote:
> > >
> > > On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from t=
he
> > > > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > > > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: =
Take
> > > > the ioctls away from the KMS-only driver") dropped all IOCTLs from =
the
> > > > MSM KMS devices, pointing out the need to use dumb buffers, however=
 dumb
> > > > buffers should not be used by the GPU for rendering. Restore GEM-re=
lated
> > > > IOCTLs for the KMS devices.
> > > >
> > > > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-on=
ly driver")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > Note, here I assume that dumb buffers generally should not be used =
for
> > > > rendering. That doesn't seem to be complete truth as Mesa kmsro on =
MSM
> > > > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resou=
rces.
> > >
> > > That is problematic in kmsro.. (but also unsure to what degree kmsro
> > > ever got used "in production".. the x86 drivers don't use it.  Androi=
d
> > > and chromeos didn't use it.  Etc.)
> >
> > (also, allocate from the gpu render node)
>
> I think Asahi and VC4 allocate buffers from the GPU node and then import
> them on the render side, but unfortunately iMX IPU driver doesn't seem
> to support PRIME_FD_TO_HANDLE.

I guess my general suggestion would be to allocate from GPU and import
to display first, and if that fails then try the other way around if
that fails.  For kmsro we could handle this by providing our own
ro->create_for_resource().

BR,
-R
