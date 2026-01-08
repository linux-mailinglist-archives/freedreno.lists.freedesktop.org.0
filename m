Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA2D060B7
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 21:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AB010E7C3;
	Thu,  8 Jan 2026 20:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh4WF1uJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApYhOAHc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A76110E7C3
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 20:27:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608Hjxv62706829
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 20:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JlZNx8uv9gR3y5zJqqbeRWF7
 zesbHySQ90ufr4l+JAg=; b=nh4WF1uJgplh2QVC5Fme2/O59F2XyZvb5Jl/DItk
 ryFu8mxvJ9boOg4nDhgOhRKSLvjZ/vN7PNRo15g2desaHU9sCOYWOeMLPP8azP5N
 ONS31DqUZcPy7P02VoB2nc6rHoWKr2q4IYDFWUU7ACSt0vxJG+OwSxYmdkSFFWM8
 Rd9b4rNI3+2Bg+VY2ZUmIIZeO+qPxevNTxJyve6w2W6ZEQjYLHQNnwwcgnSM//G4
 hjcu/HYqtKMlg9eLMcGqGUayItcI8+MTXYZ/HmdsnLRZB1K5QTFIJaZCdL1x8ouE
 bf42SWCeiFT3T3XVs4FZ6QNaaDrZOvX807+AfO9ls+zoMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqt4v7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 20:27:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b17194d321so545671485a.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767904021; x=1768508821;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
 b=ApYhOAHcAL4wI6LFwbnFDVhL0JGiL53MLsJIfj8bgjbejLwXvHddX1GylbV5nMqHNZ
 PIrsh/q8zOHDQxFjChDZTC1VLoJhIpRRwfZaRcvNtRcmr2vQa5sQhmBymZBE6Tayxv5j
 nmOKjnRHeLhk4t2pi/0HQY/ZtWyZe22ZBJenPhgW7xYRFNgTHSV+fspBP4Vw17U7xneY
 MW5RPuIzgNibMUufAR0pdsLiYH6ac/HM1JUD+VjAT1JJq/ijtp7VXVI1SssWT+UZpGn+
 6KTsmgM0Gjtj3ItKr/BSTjbFzQezDNtTRvTFT+w3upMrNOGpZdx4kmVu3gRRxM+n60K6
 2MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767904021; x=1768508821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
 b=gKTPFInkbF9bSe6rG8z+HmabuHkRe2aTW/INXLGbYQUwsdwcycC18RF3NsVkaCOVvF
 1/O6JLywucwxgVnCLEOCHAECEvB0gBNyu5ru1YCdV/GYUfQm9bx58c4FAci3MxHJ8rol
 Px0ZFXnPDCm5KxqpuVm4HEUxFphA8unnQdJ74GTaEHW5I9CtdcbBO7gDH3GXHeuVamyg
 gqArIZNtPpiq5Ge8nwiVwlThgdX+UfPll+5RFH7P1lryZj2nYuSofZJONRWG3Z9DLvjJ
 0E45aw8yBfZavnJfKw4ywlt0x2Ue5S3f0gI1VWFtXucM/kVVo0BXzaW2eBePWvBK7bDP
 C4Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4BbJ2u0SiMcyJfWBoY4F4ZMPlkBa+QarCztVUUNKti1dAZFh20rSY94zucThkFPpoFPah8CXmkVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+nnun++CIh757F7LR2jzTlGzrc+Qdp0zBfjpreQ8jnuQaRbdD
 Yi35Unb9ofazbsncuV1Qt2KtrUhS3ZOjVAuubqvfZf9SaatP3BNLPfqLRiTVwMUbmlynL0G/nL6
 zH5y+N/HwU7EtwO/+FbU1DXqsElr2CgpwXxhv5/bHClet77weWDWYDZ14io1JizndZ/Yy52w=
X-Gm-Gg: AY/fxX7kIsVE9r+Qc3Jh09f4MoRghBHpHiBxXbM8BvKGquYZ/cmlUzpMfCjmwekk+Vz
 W7nWMtwTiYeKKqopxbbzonCvXbRtw/sE8y1XZmkaykhnb15T7HO3EBvhSOwRrG4t97LsYKSHSlo
 ZeGuB7xFcFiuQarqLmHMd1SkCklkDOaqAje8heb+Wz5Ucm3Mv0CptQoS+gkjCUbgX4zm/h25aBi
 PMTJq/EaXSRyXU3Wis5+ukHs+q3a49nBRkZCohwWugdhNfpzyNMjSPM2wf1LwgOmr3Qm1NX3FwO
 HqH6reNlvfSGx018OVTRYWHjIoMOnbxonDCjHH9pxZgzMymWZam7/ICxYuxEepy2CHhGWbcb6Wz
 Ahn51bJE0XZcnOgOLKo/q64pT3czL8j/57is8Ew85fq5GdwrN9Xbi4a6o4dyEvzAulJcHldmT9i
 cnziqK7Y1CcMyYdTUzZy1EajA=
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id
 af79cd13be357-8c38936ee02mr1046211585a.32.1767904020629; 
 Thu, 08 Jan 2026 12:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+tGcr9iEka9GeEGlKoDUMtAGlIhxtlSoeNxoSYJowpomJjo9Qx3ZXWW6eqP1k6Up9bwnB6g==
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id
 af79cd13be357-8c38936ee02mr1046207485a.32.1767904020120; 
 Thu, 08 Jan 2026 12:27:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b71b7eb22sm1324479e87.41.2026.01.08.12.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 12:26:59 -0800 (PST)
Date: Thu, 8 Jan 2026 22:26:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Message-ID: <tl4a27hxop6avr25bimieet4zcoy35lvmt6rmqe74wdg6si4lk@vlm4osda5y53>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=69601315 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5j6SfgzwYxDfwc0PMj0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cyuD5Vgv9kQGlSBhZaOSYdwgSsvQzejn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE1MyBTYWx0ZWRfX/hTLZJBm/Cr4
 /iRHDFa7EOfF8B32l1KuillGJVn6mpxbxLf6U4NaIzkwmn/LF99Bg6WFMi6YqoLm5LSuwPLPhnD
 rBCh1TVlsNvF9ai+0WjZx1o92xwUd/x3hE3p30fZBZW38thTQ2Go76MNYJ+m19REPKPtk1rx+b/
 GLjYcxkgvZDA6M0XyfXAged0SmSh4AezXQUu+BZOdkhWSq3Go/RlIgfwK7YNYzi8p5Rnm226OrB
 LlOZ/DlusOKxk2L2uZdUt42gKQcyS23mYcxIEG3ixkx0Ef/DUtQIbm23rbJUF6C2E2JATmb6RyV
 b3Se3zJy2CmeIAIWk0Yjt2dy5vON0L0wX1zsvFfLhmczAZLI6BcyGQMa8+ZEC1O0pf62UDlKLLF
 vp2sSHsP88Bp4+BF6LtnpU3bw26TYnraklflOcmvyOP+tx+GiajvAHNn/9QCwYZKTdPoYVuQCaU
 fHXtE1vqgTadECMODwg==
X-Proofpoint-ORIG-GUID: cyuD5Vgv9kQGlSBhZaOSYdwgSsvQzejn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080153
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

On Thu, Jan 08, 2026 at 10:57:22PM +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
>  1 file changed, 1 insertions(+), 7 deletions(-)

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
