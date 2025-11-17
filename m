Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26FC63EC4
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 12:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0154810E05C;
	Mon, 17 Nov 2025 11:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1EWzlv6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcUoEIbE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CDB10E35F
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 11:51:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2oq63671224
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 11:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WYLAwiT4R6uv1jAYWe5dyjp8
 L/jzi7VLXlWgopt83iw=; b=A1EWzlv6SJlzks8Ugno2AHKhShar7mVKUFCwarll
 iPXHn+5Qcsg6d6GhOccDaT5JPSolImVqc/ZWA0sgNNXktHFOKJS01t5Feorcffpo
 9SGz3ZgKze0ltbo+YJ8sJeDYOhvRh2Zgi/9Zr9SN9v5mRKtHomn3W4EC3/U9c4pJ
 45TQ3aitsjOehIKo3PfE4ntNPc53ZATN4P36zoMqZ4kLk5ZzM3IIZFcfzN6SiTwD
 wYFMc7RMTGCmwprXdLe5NtnD88mD004pYYrIsoKrDD9y1EF7eXqSqUBz4x2ZFOez
 k5U3SAN2d3MT0n84a/UQH+BZPMQIT9YZGTWrMkPu6mMHoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g583yg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 11:51:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29557f43d56so53362145ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763380302; x=1763985102;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WYLAwiT4R6uv1jAYWe5dyjp8L/jzi7VLXlWgopt83iw=;
 b=BcUoEIbEf5zzyK2aVfYIMEUPjZYcPJH1VjkMfDQBwPRjXjO0N4thjrRQtVnLS5ieoy
 2Km6Odwz/tPIPwlcDpURILYlgiZgB4v+6FYoYZ3JQdguOE5heWGkD6mfjteg91sgOhIW
 5EjmNmrWhbTj0IOhjqj/7mcgB4aMoxPQkIZXP4uxiOQ0crLx53QEl+WnvHzNjZVKcmTf
 bdJ5d/KWTXWRdpWCh1ThzfHsrJiFNU8WGjThB9QgkpeOVACOSgoJtykn9ZchBdg0Ex8n
 z5YNmtOMGq1F159vlDsuRMNPE2qGuXuszcTmtupUQBjISkzqwnNJVUr15jve0/Xo+wV7
 VH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380302; x=1763985102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYLAwiT4R6uv1jAYWe5dyjp8L/jzi7VLXlWgopt83iw=;
 b=dcizDrAlPbdJ69eD60LXjHaSmZOS/I4VTin1/Qg4iVJuMZ3FbsVnr0/zNsBAsHjFJQ
 FJvF6ULEhbm/FUHSdJlFOVpn2BO1MONsaTT3dpAMIcVy3z4Axzmfe4dPkt9W/Hwhlfe5
 6j72QpEQsuOFHXrYU5ZQ4ZlX9EcOR3DCnTwTVf79b2ysZLnttCFBttVg1g4O4i8X9WUj
 BF8qRYzqivjXBbe9/wnKE1cid8rmk3ssEfPWq+J6uIqe6SdE5Sxr5stZNeH2sFB8gO24
 g0BDm5Y8ZdFTTqVNchehxUZRug79vONjyq0emZ0vmlE/v+ZSNRvbF8iprTeD9w0BlkJq
 ExGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWdPFCVbrcTdNugj15EgqFBpT9CYwTCkmrrjkiwqSGcim9VFtoFnnESNW0dZG4HUWS68spfuENwu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUE9J8nHcPVDBM5sw23Carlzaxir4eaKOABo8kG6Ce5efryJAl
 LqgmE1AdWgHXuYcx/vpyg9Ke7ia8JzMNJQjFSJkSsEjy+fgmKrqPcctcrPFaekVN/vv983yJCUb
 gmA3a/DLtgZOTUxjcGee7eqwKbtoL5QNAFO65P6nFcqELCTSAvG/dbhRqVhhwUbBRiOQjDAbiDF
 ibrumNZH8mwZWFGTdfbINh1Mbxqt82e2WSl8o0NYdCKO6sAQ==
X-Gm-Gg: ASbGncsvPlvJP+L6iXYrhewT4gEkfDzQleqlZD0qRwaL3xiZaSu+B8bgUazHx/7qyHW
 EWbvmDykjxebAUkry6iS5pSgGHJPLP51tVE2uOAM4kZtFVmsbnCv/tNKdVPpjr/aU8AJ/BAy5Wd
 k63rS5uWpXAMosPrXdPiR1PLsVdDNC1zwwC2QoKBEizSvvfKjoRt/JK467S6XcSNdKx2ZlGmiyb
 nGt/SPWMHkvC3s=
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id
 d9443c01a7336-2986a733395mr136201295ad.39.1763380301943; 
 Mon, 17 Nov 2025 03:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBEicDfJ83cSCsKbUuvVLPVCMLfXBFOILWYFrgA9wPVMoV0gqTVn6LftKS1p2HKjBWSv/bvpkjeIJ9TH9GPrM=
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id
 d9443c01a7336-2986a733395mr136200975ad.39.1763380301388; Mon, 17 Nov 2025
 03:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
In-Reply-To: <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:51:29 +0200
X-Gm-Features: AWmQ_bkuOKYfJMAKqGOVS6VALoKprEWuD_PpuMz-0Npx4AVyTkqubf-cEM7Zxco
Message-ID: <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b0c4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=b1ue4J2JLKFJIZ4Ya5QA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: e6wPw_RLbR6wzTFss7GGEZ1Pd17TTBb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwMCBTYWx0ZWRfX4xEmZJhqYLcK
 XBd/K/CwKqes1B6uLzKz2a9+mWbmprjBLIpOMKfAyNigaCxzQFQPvrPvFGO4x33VtZeDtUkjE+a
 mNWG/QbzlwCJQf3IZAfJXByK/SB4CgK1s4FZ2/iE0PVh3WvICvpMhtUQ3M+BygJodFv/cqE4ClF
 0qbbc/PLmS/i3Jt/q4Q0giyMiM/AnduC6H5R+f67vyonLuiJ2fNLRtDd/SvLcM0Mc8uZm+qHAs9
 /BPcQUCffH5EnrLxd5IrRM2m0qfXIffCVvObWjgrKJEDrgU1U1MkISRqmfOHlVkgKZkExtSraFC
 gqVfVhLI4Gse7Xt2TWBZKX82WUGebdao1pXhEQ8Dh32HxAZ8OQkvP3R8oZW/fVYjUrWLadOJLrf
 RF1wWHl3zFbcp3aRru/ScHLLhzycfg==
X-Proofpoint-ORIG-GUID: e6wPw_RLbR6wzTFss7GGEZ1Pd17TTBb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170100
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

On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> > IGT reported test failures with Gamma correction block on SC7180.
> > Disable GC subblock on SC7180 until we trage the issue.
> >
> > Cc: Federico Amedeo Izzo <federico@izzo.pro>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Most likely I will squash this into the GC patch
> > ---
>
> Peeking at downstream, 7180 and 845 should have the exact same GC
> (v1.8).. it seems like there's an attempt to program it through
> REGDMA instead of regular reg access. Not sure if it's actually
> necessary or just an optimization

I think it's mostly an optimization.

> What tests are exactly failing? I couldn't track it down on FDO GL

See [1] and other failed SC7180 jobs from the same pipeline. I haven't
triaged it yet, but I assume this might be related to platform
resources (it has only 2 LM blocks and only 1 DSPP).
Another possibility is that maybe we need higher CFG bus bandwidth
when writing LUT registers.

[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393


-- 
With best wishes
Dmitry
