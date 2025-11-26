Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE7C8C0FB
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 22:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211A410E6ED;
	Wed, 26 Nov 2025 21:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEl/yGbC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnVdE8NF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C7910E6ED
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:42:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQBNxoh1849691
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=z+WPrqph3VWDf+dS1LJJ1KlR
 DwYS2bbPcyS/oPhvXlc=; b=GEl/yGbCRUI/c6OQ8IPSjWdNvZXV91TguQT5Y6aw
 PcDDhC5scY/y7LgUKz24x2muKP5S/mYwvC8lYOEnoncCvbwXdqjoUsE2NbXdR/jz
 FDPDpCB9o3SUKKPH8tCkY/jHh0DR5TS77wP/DxSO3XXu09ceQn88dELmbY0sOYIc
 HRaHz2Ut3sJUHivN9lqE8ADjYG2WYLh/XbmpChF9m76oY18Px/pRaWlrDvjCmL/8
 KDWElglI16o3+Hp+CsE5ssTRU29PmAUGTtdGXpfyVRVmAbxJQP5wfVzCXbYBQcNV
 pFGawcgkSYkGLFzJ5ytdsieRRB5WSpmpD8O6rll9+aS+kQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msskxn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:42:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b259f0da04so52362785a.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 13:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764193364; x=1764798164;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z+WPrqph3VWDf+dS1LJJ1KlRDwYS2bbPcyS/oPhvXlc=;
 b=OnVdE8NFMsYYePotQ0s3qhLWpPILLEJ2awyNX52aHNPCfipX3jPvEbaMxli9DcsQ7h
 d9v+h0DLyiLoXOMqXfYV4MUukU3THvBDINvmOCThiwEqlxXzQiT/c4/QCuebVtu29LDa
 t0C2qndZwoMX5gP8WVJRLPXlsL2fOvKLd2ZUIkq2SJ5YYcs9O91pWAYlMqfKprrgkOe7
 u3xGCQPElcgnQ1/D1cbvId6Saq7jZMyEg79CRN8hHF5YWcQf7C/y4a2BCaJN4qpwPAx2
 CRjuDO6iHxTEIUmZnMtWa/fmntHNPUFHpqAYJmHDfRCOCMiKlUXwDZyYI4btaHdPUEhd
 NSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764193364; x=1764798164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+WPrqph3VWDf+dS1LJJ1KlRDwYS2bbPcyS/oPhvXlc=;
 b=hpREDq65SUZH2r9Aa4NNytv/GizSYpI8oAwOhiOHAz0qmhHlOHzFXGHmhXuAiNpfHe
 9FrXYxvnkQC0rnaY44+b6A2G8NpSyracP7EHb+9Wd77nbjB4mNxbTrLeQ2n3MkDv6nFo
 vJVzvoVFZHLokGsH6XBkj02NuVjMrUeDunfbPD/3sj+pjrajy2GqSn4I5yWvv1Z/0LMi
 hu1HA4Icj7zn6fjrLtadrAX/BfCmhncp95HQfglGt/mS1UcUc/VdHlnRXyOp5Rso1yFX
 ViNfRlmIYx9oJ5eN0AMD6aJ2V9kQ7RKVI2tjkJKl4ikfXKGjo1oy6PjDAQ/zfsBfJO6Z
 Ypbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfskxjPIdsU1KnX8FZlGg+3mXshVWKn1OG55L086pEByWk3kqEr6E0UjsDKDCbIY2tStkF/7Ns4Dk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhHKewPKJTq+WjQ7MsQtzzfArhfcvNGfH1fHtqldW1hH2fvSCO
 EgZZOlcgEtQIzDfXIjAijEc6h1kmtlrz81W17zoGGV+TazuvfYzSSg/r5uHbjyo+4WZf4OU6o/9
 /LtZmpn9sNbDP9OO44kNySN2AlE7C9w1sD7YHmomfgsBgoQyNY9cQXdwzbWFEMkfgkKE/7Qs=
X-Gm-Gg: ASbGncsGOPuP1AUX+xFUsSIpvgYk/dci8Tb8eQoc8X06PON63kRYRHOAS4GMkpjxW3j
 hFLjwfO8oFnRF8i6A14D1OOQ9yn8c8lH0rtQT4vtLxrFD7Uf1C8SVY5CLE8XQtt0TmuJkNoi0J2
 UI6mLjUpw50SJ7nvTTpD0UpMFlleJXpJVU2zJLRnk95YqEZDfCm5LkFcNJQSjjLfaUoOrmaZe52
 s6Iv4SPs+VxE2y4xUw7feq0hSCSnSSJ2++SXh3yJd+gCw1g008UtYt9BZ7tkgawpSY2Q3w5SC9v
 +gKvTq+u2AzVN8MD1rTxuNFOL0OcdLTL3qYafK7swGTth2s++s9w8Y92W9H5Gv8NWoeUYLSWblf
 GrQsrbO06heJOzSzpZaTnEvZYMVq7mU2T6CqJdfDaeXf3amjSD6ISAAIkeb1iIgD+e5QIXUwmwh
 hQhcqWjR/aZLPx2v8BQYzbp5c=
X-Received: by 2002:a05:620a:28d2:b0:8b2:dd7b:cc8a with SMTP id
 af79cd13be357-8b33d469758mr2883989785a.75.1764193364102; 
 Wed, 26 Nov 2025 13:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH2vVGd+GcWOMX+Re4xb1YF/CKD+k9Z5kHfJEow6wWU+/bNxqvRsyFDVIN+UdpwQznY75zxQ==
X-Received: by 2002:a05:620a:28d2:b0:8b2:dd7b:cc8a with SMTP id
 af79cd13be357-8b33d469758mr2883985685a.75.1764193363526; 
 Wed, 26 Nov 2025 13:42:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6b59ef2sm41430281fa.16.2025.11.26.13.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 13:42:41 -0800 (PST)
Date: Wed, 26 Nov 2025 23:42:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
Message-ID: <c5t3ae5ip2eoxrxv34ssudf3det73nht2ug6o6ia5lawy2ws7d@jafvcijp5hjg>
References: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
X-Proofpoint-GUID: wueJzu93-wz_-tsjlwljzh6ntF65RqIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NiBTYWx0ZWRfX4rSkHG9AiMGm
 VfB9WA/x+BjqcOLLEIVJU076bmYN6Vhk3zhQMOMDRlBbgybR27TP1xYaXBgrmQifIa9Woe+FFLt
 mHKR0wLR/XDu0t6UzC/tQoWQVBGltH/slDEU6U3ViGlmmqVVDuWJ0DM8AMgydhi63duI/TPYlEE
 MGHBBrONwK3MITQCeleAol8SKsLoeZ+VksdWmYd8CzmWXIbi8UcvNt8EdDQj7kouL7fOnyZOoNh
 pO5zPEcjuFMgrnsf4ikSwkLectBeb8VhUPGAyCumCYc2WDLaBRYHJoFksit6jWetQ5XUHeA/vdG
 i+YXpQ8wAgNn47WaH7mL/qyh9W4HMmxTydvNbLTUtRCLQb/TwdhiVSZ8csWuGo4nVbfTGtlFfmV
 fGLm2NtnAoobVswoVKiftJDFlLMBWA==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=69277455 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RUpeJWWRx64e7F2V8Y0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wueJzu93-wz_-tsjlwljzh6ntF65RqIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260176
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

On Wed, Nov 26, 2025 at 10:31:30PM +0100, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Added Fixes tag

Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> - Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
