Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721F6B53304
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 15:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F1210EB22;
	Thu, 11 Sep 2025 13:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="biaE/Mqw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117CC10EB21
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBvgiv015855
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OTyomZaXMdmAPphIgRSMvoxt
 +heXM0Jm3kdfZ5nhAw0=; b=biaE/Mqw6t8Yhq+11rK5s6HymjveFoH84bZdi+A4
 QXLKg6aHYBSNuhLIU+EBiH3ipTpy09GohI3kFprt7m9oe6W2kuQoEII/jVpov/qp
 0FnoYlAUhh2ow7Yj6U/98nsEQwDWInI7Uo6lENaZ1z56UtRAXRx/iB9aiOaFNdEB
 QfNGV5O2DZpTJ1jFlI3SWZV03zRIfjZxokCI9Dk5HsQY4SJGQjLxr9EeS/p2/AvY
 CX9Q50nA9LDqoThi5P1vD2szYpw+JP+0fDGXT0Kix0ib9VJR+YXGgpBZGY2Svv9h
 6ffb9OUJNbXGnxAsW229ttwxlMd/5V8Ng8iVTgW/BQdvPQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7kep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-544b6ac1916so2963736e0c.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 06:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595728; x=1758200528;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTyomZaXMdmAPphIgRSMvoxt+heXM0Jm3kdfZ5nhAw0=;
 b=P+EXG/0cRLo6/cGhzGay9zmlCYd49sszk1spexCCZJ50vYMVssGmKNaBK7t6PLjEJh
 0GTDpfPnU0gUobPY0ffN6eaLqUdXg6p7IbrE8q6a73xbORsj3u+D0qfkrdsAlVvVNHr3
 t0x4GaW3zvKV7CNjtyhmtdGd1l1em3qtkrjy6lV9QZWrNMDTcupFPSYslwVnniNrCQM1
 6B4xRU/LS+ZAN/Dajhab34fIn+GOPGJV5+7Op0HOhRU03og52sdogk+hH6pjwRXPHmfe
 bY9EWBsjRS9Tox+ShKsGM3ohtFAwP38NPtiLuZLpsiqtygn9nNy79Bg4j3IMNl7K+3MM
 jiaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp9UHi1tyMtSUAVqe/Py4qeQLJqwVMHmZJbCvP6cNG7w03lmlnie5EV3GcRxlEAEADwFOV3UHl0gs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbGRMZs09QtuOsVAjnjVgRW78hNJYw0MtY4EeGqLWxTHFiCdxy
 0N9G/XHp9cIFxd5K+vvYzuMzGNWpjy9/K8KVzFfY+kfWQr65JmtSgW39qILgU12hrB54eCtQAVL
 b5KjHS+WWR18TeoNY97QO596wTCu6f7R/4Zug1WvH19i2Ywd3jx+TY207QF3JESVPNgQWcUw=
X-Gm-Gg: ASbGncs+mOFoAyodZ1JGu7Jm4LcUxLJXBOpnTiAkrCYJeJ9hwnd+u1JQSWlbbOd5E13
 nHRpbuoDGBJSeFnqoFtL01wBhLx07eiTYlNwPUSTcE1srGFmFqCB2fWYCDgaob6sZpXlmHGig68
 gWjXMEzsyyvXBb8LZ43jyzmhuZBF5M0uHr1DjrMdIWuIER7OnffKx6tQDEUPldMoTDGZxabfRBU
 iXfSuHwNlJkjNXuSzJ4HBgO+zYqBLCMOlaPhSXe3P0T44sX1CrEN8y8EOMTYlvgjDBDYzistknt
 oYyaaN3E3sLYZ5RUwgl4q5EIT+9sG5SrNJEELLc7/DdStdvVd+3dq4/sLe1ihW4ESliilkxDcUK
 VySIlDtoXb4lZQXgXszYwWIbkIeWHawgumZ4Nn5cV5JnN1D4CO3eX
X-Received: by 2002:a05:6122:6315:b0:53a:d808:1ff2 with SMTP id
 71dfb90a1353d-54a0972db37mr1035133e0c.1.1757595726876; 
 Thu, 11 Sep 2025 06:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhv0v3J8Y27t/nw4xhWgdgl8LDzWqA4+LUKRc00IUTMLdn35XdPB2ACx0uT5AlsOiegud0kQ==
X-Received: by 2002:a05:6122:6315:b0:53a:d808:1ff2 with SMTP id
 71dfb90a1353d-54a0972db37mr1035032e0c.1.1757595725938; 
 Thu, 11 Sep 2025 06:02:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63d50sm414692e87.65.2025.09.11.06.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:02:05 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:02:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/msm/mdss: Add Glymur device configuration
Message-ID: <hxyh75aajlaymbvaghftcz56ttbpnmxfnc7amr66hhpbt6n5sg@msh4ljalgmvv>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX8P15XBM4JyOr
 txmwGP3FKDYZCIjYVvOi7I7vUf/7ecDlmWj6IB0sqx7mZECL/Ljkxr9vED6FBPMpBY3SFLzceMN
 CMWFU1zpBRzXi7/vxPZeP+1wVjundSHI3Xb8B+2yFGwrSv/93068lzWzRd361f3Ud/J4G4HJjBP
 lLRsphSVUJN/f/LDPXgvLVDPbI/Rxh8BySqL+pMujd3crkmsjvVBemcoOIxXklNoyrkXGsy/urT
 GHfPmOgQZ7H5Ot2CMclr9zFXQlxGypFOolVCPJoLoStk8glyLJKaInbWFnVaZcE1M3pKF/qWFP1
 +EuRuI1/TiHqn8jUMYqoolJKUZfx2BuCIVdpC/Fo6LO1FHkdNY3BGlKCFxlbIDuHReagF1tl4DL
 kgPePnY3
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2c851 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vuHc2ZSrshEqWGcFJyYA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fei3P-zFeW3rJSLERaoQmSE8b7VT5j2m
X-Proofpoint-ORIG-GUID: fei3P-zFeW3rJSLERaoQmSE8b7VT5j2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 03:28:51PM +0300, Abel Vesa wrote:
> Add Mobile Display Subsystem (MDSS) support for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
