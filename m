Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696FA84CFF
	for <lists+freedreno@lfdr.de>; Thu, 10 Apr 2025 21:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D2D10EA45;
	Thu, 10 Apr 2025 19:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV4G4NM3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532810EA48
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG6Bl6032000
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=; b=TV4G4NM312v9HVjc
 4D+iftoKVsdsS1L546pNBCtLGMuaUjOi1i+2q/Rc99W3Gy+RKhX/da/xJqB9aZjP
 veEcWjCTpQi3x6EUD+9YUCNH6qpCMRDPD3UvOx5BixWbOrjSUK6D6ReErtp/I72r
 +lcckd1McY3/c5+PLVPa5IGTLerXSEHtzfPhXFotyqtAtbQ7Qj2MoZjjw7IbCqbm
 vfeAHOLFn5A3x2LyofkyAPTArhTS922s/mpEbwNoYRrmJx80ytRVpzOIgedLLfat
 PvWxdArk3gO6xLndoArp9e/BlpUY5sYu4V9p2ILWk5y4j99w5BkcMBk1ePzeAMj1
 g2UdGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmg1pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54e9f6e00so350689685a.0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 12:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744313294; x=1744918094;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=;
 b=f2KSrGkEziz6OstDnGSSDt65G7SmbCamBqcyPadCRAejnQbz3fMjAqIQf+SHfQwiFU
 qLh7a01Y85jZRZX54w8sGboMJBxL1qpvI79NwDqFendyRnY14I4ocBY6/1R1ZZh2HBVp
 Kl6yfmqeoGlG1H2ofXPcoW6CViiUb6CaGCPp029+q+UbzX8SlnASBGIaXlVSnG+jKLsv
 eyL42hkqfcK3KUJ9iwMbHy/Tm65OtgWhS9swEbiLpdk8gXzMsHM0OGzU2PXjPuch8CIK
 YsDqHZyeNY1jt971IMWKq1dV+iZLifIZOKnpA5ruHL3olcMWDR+9b1jVFFaRPMAaw3Io
 9D2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL2PpQ3oiZczWxLz/H833YYxZLzKkqxNP9W+HvwfxgNfQkVjxDyBJ5vxYB3irSwgao6CcpdBzFo14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTJPbvPHgDxGV4MCizfRNMy8XuT1vwLkzzXlKIh2x/jrW478V2
 XuFb7JRYAwJaZF6eo9xNUNPJ/9c4hTmcLqyPtmnXNMgf19uLc+jCqSbZF3G73PlZaqlkLUuyPPm
 Ljm3pfq2nipd/DScdZhaoTbLdNzTN/pbQ+MEzbhnXZx3zWlGhs4MLyOdT/kGCRhgYZDo=
X-Gm-Gg: ASbGnctC+DWdRCnBtdMHKcg0ufeXM6ctYClmG3bvARbiZtLPDtzwasXKycq9wNGnoLW
 iWDvklwGavYPQdjH/EkOxsTnCcxPxhqXpbERHwaTsy4bzV7RdF+sv+arUFLfWbuNArEa4IAAc3b
 pALGXfxs5lY5s8cpuzRNxWFSCAPzB5D5HzUtPF4Bm6+S6EIB/A4YIdMesf+AKkK4wxVg5XMTunv
 utWU/Pi25JVLCpLpzlqMbtqyQqpFfP6NT67WILSmBsrQiLGRk2u+8nr6vkfElrDvpcxHbjrGh5z
 VD2tZCMizD9IgRw31fKdhn/bXXUbe04MaV3LdD0ImV9ZcNCcfik8ODha4/3tM6VsoT6HEM7ecgM
 =
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c7a765e51dmr560004585a.8.1744313293999; 
 Thu, 10 Apr 2025 12:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSpgRoH6+EQN77MiLX+UVvWsFRwqYiRJvK45u6T/7sV2nB5QKrHoRaFMSU86+dK9p42cd08g==
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c7a765e51dmr560001585a.8.1744313293707; 
 Thu, 10 Apr 2025 12:28:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d502654sm227020e87.111.2025.04.10.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:28:12 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 15/19] drm/msm: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <ljqytcjityeqrek5ik72duv3oblcapm7sqysminnknud34x2v6@gmjngn7odejm>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-16-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-16-ville.syrjala@linux.intel.com>
X-Proofpoint-GUID: vEri3wu3ZL8fwPhIdnRwxvO8ME320sEH
X-Proofpoint-ORIG-GUID: vEri3wu3ZL8fwPhIdnRwxvO8ME320sEH
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f81bcf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=2eKwwukf-V9ccoo5c-0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=937 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141
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

On Thu, Apr 10, 2025 at 07:32:14PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookups.
> 
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/msm_fb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
