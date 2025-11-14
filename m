Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83374C5CBE9
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 12:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F2D10E23B;
	Fri, 14 Nov 2025 11:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf5NkDbs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SN1/t2hx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A4E10E23B
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 11:03:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8JIaf1477709
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 11:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=; b=Sf5NkDbsIzoxNN0g
 fio1is6hSCp4F0VbBAhVOImlbSGrtkPsPOnykwY5S6C3X3+DXOvTi5vxmmfSaosg
 PV6wf/0NoqTkha1yJ7E6P4BC0gB1++ENh49zU28tEaqZwM6SbEy29EHNqwwWH8Cx
 +3X8F0SyZln8FE1mRP3LYwY6U2d30/pkkSe8iTrJARyUCizFIo7DjG2asuIm2dhY
 ogKE7tL3HTflIEoBqJ9CAfaftWU7zr6I4pUZ8H4YB3bQWCX/abr/R1vYkj/2NGZ+
 bnJjU1pzQYmnVkUuiwe6Ehm+wewO7ZvtBXoKBszjWw9IGTJ0xPgmvCXGs1sXm8S+
 iJqcGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dsw18-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 11:03:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89090e340bfso416765285a.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763118198; x=1763722998;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
 b=SN1/t2hxKmMqwb/yEkSuQolFSMQtg2YOLaZVBUfQu0k9iNrTtRSJYS5+VkMiB1NxRf
 pPnolOMjZQdMjmQfa2lZKRMVA+jEjvnd61kbEE23CPbNDO5xxfDjBgPD2lybKn2NWRF/
 /Sb5UeuGwxNKy8vAJ33vHm79LWwUEtvXvbmzFSnob7/50s+58wp7DEZPqkmcIuaKSyyM
 9HR+pSbwYqGa1CV9Y2rmiyTPKrqgIU/6icfpXScF5AeKMueYw8QEwY/Tjyp7Z3Dr7hKb
 WXgQJXuFwBtBFMssKXBnzGW26dOrx+DKT1/KyjgByg+dxwjmxYNb6xwyN/o2L5RYIQfY
 MFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763118198; x=1763722998;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
 b=gFLmr/UZ3mq9StbFHBSrFT2jxfR2840MD0laoFolGe/lVUd3eIPOhV/Cj/3E3VvNSb
 mqSGUKjrr08XzFZNN2wNwHgO4I+QyK0W3pKXPUrNrTRjTjEo+RC99G9a58s+7aeDFhMQ
 DjrVs4sN5f7VmtcPGyCDjjDOmCKRAA2ialCDpMpyCKO9p8RrPD20IYiuea2VLCITSh97
 oHkYBQaTkcKJOrpOfRM461B557a4BkL3/3kv8uFlLNSKIWLyVB7YkDas3EcGDfW894e3
 ErYunvQw10yxiQh1pQJ9zRg5KjqnWSS/QBBwo5aw+8UIjw8B4vQLbDxY0PNa5cET6KwP
 B5Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQHv88oSwpDYJCKa1Wmb6kZkhsRvnjgFqRgliwWGBceHXCJYEwR5xfeHSfW3JaE8VLh1+n7oPXwjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTR20c7EpD/95szLKnkIZUv9Wt/8zg4GoBR3m8e32UL3Bnh/TW
 3YH540BIy6DVqgbmZ9E3MWOnqAa3BhhXrdjbajcY//1k/sIApKksGSw8HQpcCm81JyfoZzJDIib
 n8V0IYmJzaYBdNAJt45KUYKaEQ/q4QG/XozbWFqMFRgxT3M/P1QzsMD15XlBYbdhol14f2EA=
X-Gm-Gg: ASbGncs/24ls0hD0esenQBJMgPWmdJeNzq7Osk2ESJEhLOhvLDR+pxqo48o1abgvPou
 2UzXQFHBsou9EDy+ArufAPltjXrxldsxvyJzY5t+5mFbpexlYdiylxl57XLBV8saXQ0sKnH6uWA
 8+bXBCy6M+ivX5Ya98XS78J2IOmQqpzmykuEDj1jHmFDGX88AmvoaAkDYNYyypS8NqrxIdwMg4z
 oyhDiGQRem/KUqLKp+U9dBst9lII1I7RE0LXa/YQdfEdcSllufZeCah3Oo+8MQAq0tLKdkIoOkL
 5uv+nU2FF2F2GaSPbkndgOC+kt5wYi3rS1XR37Pgp5azSI9QRPqpxdhCR/X2c1YnamQRa6s0yCS
 9bUeFCj4Z3P+EamgbUsmMjk/KLsHE0Nen31yp7mcMpnwo+8ga/wJ2SiIitDfH546tjseZi63lzc
 3lmhlSkgFBlW5r
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4edf20a3de9mr40782391cf.23.1763118198139; 
 Fri, 14 Nov 2025 03:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnk790PmVPOn1c7OeBtDwurCO7QZI3gzzVeXmoG8GqrbzlotEwQFNkCiIoA940ETO47ZtSJg==
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4edf20a3de9mr40781771cf.23.1763118197632; 
 Fri, 14 Nov 2025 03:03:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9ced4adasm9135771fa.26.2025.11.14.03.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 03:03:16 -0800 (PST)
Date: Fri, 14 Nov 2025 13:03:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: federico@izzo.pro
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 nicola@corna.info, David Heidelberg <david@ixit.cz>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Message-ID: <ac7fri2okl3bvzvfnjxg74x5gekn74ii5sslvldfw4ioan57bj@w63zkvngpi4x>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69170c76 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=ZFu0rgk015Nm-26e0XUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-ORIG-GUID: QVeumYeXJtqagzK5IBuFK1qnXRzGEztk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX1rr4LhpMB32V
 fe/8iDOWL2qN5hB+Lrqthh9/YmPYsQqeGZSK1Ac9awDVR+yKR7ZpgdiKe0Qzt1r01bAwSZLAa6w
 PeyzOlCbcOd5B6maIf0I3YF11HpkBGSivbJVFdpgbq5APyortHZIEIhdLd31KMtpaHXCw8r8Di7
 rTFyEkzVZtxWYHDDzCbT0pCQeWEW0d4QwkPlTBrNFLfM4L4oVVFwTGgKKU7IYiglzqCLyp8kjpc
 c4kOfyj/4Kal4Cv0O2ZPx7n3UHPoFP4CuHLcB2IAb+catuO/9w9VTtD8Z63xUDPdc1nojce5YCv
 EjmNm8DLgvo1IvBOY1/EdFSBsIy1v2jHW0ImQFDgLulVmD6XVMBry5Lfjc5dn7XrLNmxqWVe8+u
 +ml/2QpNZ48y5J+DVTLqTTlLxogKQw==
X-Proofpoint-GUID: QVeumYeXJtqagzK5IBuFK1qnXRzGEztk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087
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

On Sun, Oct 19, 2025 at 12:06:32PM +0200, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
> Tested-by: Guido Günther <agx@sigxcpu.org> # on sdm845-shift-axolotl
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct 
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.

This seems to break several gamma-related IGT tests. Please consider
taking a look, why are they broken by this commit.

-- 
With best wishes
Dmitry
