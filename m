Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB3C33881
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 01:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114010E68D;
	Wed,  5 Nov 2025 00:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfDnKDcm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Icm6PrK2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9510E68E
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 00:52:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4KffiE2927496
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 00:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mF+cLKKVRQFP3GvNceM/xWFx
 mZNCdYIyW4EQECMmO9I=; b=GfDnKDcmJbgEjVa1R/Xi+95GqnRXT7sVjR2jfZIN
 Fqc/jht0INTlofOpx+e4LJlUoiI1KbPU/iViAXvdmmcPcEtlAgdaix2pFl749Y5i
 Gqtntd8ZRhkHEpuDHWdfegIPe63fJBVO9sKlhqOUWGXhyf25o+lnvZw1Duz3rmDs
 pGluoIET4yW2TdnZb4sXhZbjDyO3jc1rjJriVDVOFGYD4k+DZ6ph6Bb5wX/ltIcT
 hCqKqRzCIJn9Juvv/LietW0Edeha8xrOzH6kXvURaXOLrC1+Ub19y8rcagLPVab4
 m3vMNetuG2Py8zVt7gcTR2kgXG9pCbM3duI3XggfTycvRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5sgmb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 00:52:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e892f776d0so303962791cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Nov 2025 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762303934; x=1762908734;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mF+cLKKVRQFP3GvNceM/xWFxmZNCdYIyW4EQECMmO9I=;
 b=Icm6PrK226AJc8nu/u2JGLJgIBiH1uahtKRyfrnXGYkmQb9hqhlhRq7kxu2mlxNhQ/
 ySVUlD6Qv5KikvagY7NULkfLieqfxjxaNRpZO0QrThGT8JlkFzuOiqGOUUysAQp3jEKq
 hjsg/Ywcz2vCBqiU8VM4mRkeVLZixBQDeHQVCwEEc5YAXacCi/rJz0atRViC3/Ph9Y0g
 YK7eB4hCy2xTv6kGYxymn4C/UlIPlwy2g3Sab041A17KvecKO/06dpQ2ffalwBgXMlUf
 ILWODyX6ODoDIJS2gIxhguY4z0+fGWVVLSC9Bu4SCent7hDS4OJgVLJvGAMbS76jOsMC
 bJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762303934; x=1762908734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF+cLKKVRQFP3GvNceM/xWFxmZNCdYIyW4EQECMmO9I=;
 b=MoP3syC9fizNPUx3t/EuvbPmrd/1rijTi7aS8tjS85cXL02DWwqVBajn9zQ7otUBCv
 5/qQeFUODihybOYXle/+fAtDImCuLvn4X4BUhIOlrL9jkY5SqRytKdP6ZIhlF364zV2o
 XZOpgZGGDcapruVAEleGZDVBoG04PqnJnh/OVC7JzTJ3rHkbtRXObhG1brxc4fcHh/hp
 D163D8Fl6bBivNsclKF0fdu0N7CSvPs9qXlwoHcqKBeOBYxmVLUAOl7QwOVAULxKPm5h
 eeq6K89VHALBwP4dDcPX0HgMFH7p2ZZ5xFSFV0aG+JU/jY7QngRFDOm4GdlJILx/IdhU
 fk4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNP+EXkLcASpsA2Lhetk5aPmVkzNdnv4vZMmWkAraGFKwSc36G2Nh8xvqYmegzccJL0MZ3YTJsFy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvcIY5OBoxIFkcejxJkb95sWViUGpqvBxoS5j3cdoll8YNaPxM
 1TlT6iwNlKkxEFFrONz23P/t2/ihc1MSU83efVqswL2GhLxx4bQsp6R17mqcORmUw3D4GzKOdCO
 wlf+qIcgLiHjh1iiY0jHoPQoSBtOo77ldCQm5dqPfUbi/bgYeUMzzNQL+vh8yn3ubWtOBFic=
X-Gm-Gg: ASbGncsFIMLFQYMZO89++kU6fWfxIwUTfKQlO8j15VUpdshoP4dDFEHOSHJ8GH1qOn6
 viG8O+4XDToo19M0imKPTCFSaRWxsoPGHA4a7QuHgn6BcIOeiAuPZ0T55X8KQwwdB/xAAWpMalz
 MR36jSontaXhABPkDNoZpja+wit/Mysb8gk6qxQHPHSPFeYw3D7exfAHNZB6kp4Riug5Lycclbu
 1o+8N2mihtMmdRZGYN4Cg4JPihP84el6LliKu4xSTzzKjvlheqG95rSfqbrKJNYOTeR76qxEV24
 Xd50n6cdGtAweETsxbQNYowSsPZKhAL1LaoqUhMZMdnXiezsqzronO164wRGyW6TOFzh29e+ypZ
 09fkBABV1wpWuWhHQkRIm8PoUUukZ+84hVVt6tsh1j6Yvdzm5Y+VcmVl6anmQ5HwqX1BtBFOxIA
 xPUy5Ce9IKicds
X-Received: by 2002:a05:622a:50c:b0:4dd:2916:7980 with SMTP id
 d75a77b69052e-4ed723300demr20380861cf.2.1762303934237; 
 Tue, 04 Nov 2025 16:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW0DgYaDDDgZj+/uKyzHvi8EHOj7DGy29ph+Uz3G6jt85XoV7F46z+h4bslY5sXRqHQFhVIQ==
X-Received: by 2002:a05:622a:50c:b0:4dd:2916:7980 with SMTP id
 d75a77b69052e-4ed723300demr20380661cf.2.1762303933833; 
 Tue, 04 Nov 2025 16:52:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5943443db87sm1187433e87.52.2025.11.04.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 16:52:13 -0800 (PST)
Date: Wed, 5 Nov 2025 02:52:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
Message-ID: <icgutv7idot4h2fqx5iwhghty6h3gtqcsp5vbdgtw6jwjliy2f@536e2qcqpzmq>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: -br5ruC9sDuPw4zuABhbQ1k-kqGQyGZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNSBTYWx0ZWRfXw59wWxLKShG7
 /RUrUoVyFSBdS78UJnC4ijtj6z2ReIIkDz2b1qZo9PHnTTHHX6NzDn7i4vcwbdX1EoZmpS8/9Op
 yjUdelcViY4Cndhv2+6csBCSAG7vei92XcJVa7MlhB9poA8LtyLIhVcP+PZdhtZyvZyzYwHaZ9W
 qxJPtquniMfAAar4QWwhkwsD5O8JFSM8Rc3slgr8cLuBp9DdEHAohe4U8AYSLHjoHy6WyktMrfr
 E/s/hT3Jmp4STucvbgG8l2yIQqXMgmIFfwFvKtzg/O3ETwSTBmTJzMZxvdrfZLG8mCCF7jaitxV
 qFKCeSJ9DFK0zSCaoZoagBS5tTSH4ox2LO2G0cc8XpGP6QOAMJ1ZdPMsMq+Ci/hPCpOk754PWtM
 2GGp3l68HvuiXnsr75xGS1a60ahjaw==
X-Proofpoint-ORIG-GUID: -br5ruC9sDuPw4zuABhbQ1k-kqGQyGZP
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690a9fbf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V8cJkdWAq56nonIdhLQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050005
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

On Tue, Nov 04, 2025 at 02:02:45PM -0800, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
