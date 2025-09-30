Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC47BABE25
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B21410E514;
	Tue, 30 Sep 2025 07:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vw/XAKGE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFA410E50D
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:46:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4IUPb016331
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Kji2nmZ2FEr3Raw9eE5h6cYw
 gKVR2CawlGpJNJ1zd3g=; b=Vw/XAKGE1YO/T9KY5F5Hr22nkn+F1e2vVFdW0Yk5
 HucrueTDHPW8bQKdDS7ZSJUH3pMjsUmxgjV5CwqWy22p0FkJGOSH8eDfhqa99wnu
 5vEcvfNhuri2ynbFqymBxNt7EZXstZtoGedJRH6A5Pyrm4eC0yqYDV27uLk/EqRt
 o/cXfEAV0/hfQyepZ4CuB64ceNJN5tA5Gx22Wf7at+joGv3XvywLEfUK/d6N5dI6
 tO/IDDnLwKdrQ6WtRWBlhPalt9dKwRC6wSlNQ5DSkDFSkfVTKugIaHAwexVG3Q4X
 HiJbykLLeuMB/0zcLomnZoSPDz6RSPpIlh7S9P4PFf8sqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr03w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:46:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4deb67c61caso85059531cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218359; x=1759823159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kji2nmZ2FEr3Raw9eE5h6cYwgKVR2CawlGpJNJ1zd3g=;
 b=Ysz3mAmbkaINGISuoeaZlhBSKCyqSbMDR0ZwaTQlaFWNup5oP12IzoH0VgQ3G82uEl
 7T2brR3woTRz1IxlQQ14ioZItVPEZuzfAxlPhbaASuxWV53DNQqxypUkzAr4YMHUBxja
 h5D5WkDWQj4TDmWZxTjYwW0jEcSdmXjNtezPCZxPMHDqyRZ/Qg9w7hUFk1LaDjCqxiaW
 3+Y5Fzc7673UB0+EMroSbk/OIzX/yBo9wndYeP0kHP/Q7lJzuRXWbqjtwaHLSJ2Rl7Cy
 fKno/z+5lE3hUsG/d0kg28dZ4+dX30Fe5AyE553NwIGPppbMA0lKFDUSl/6ApFizZJD+
 4p8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9RBeqx+0Y47xSpwn3OEB0W+Mxdly7fy/KVlVuX3Dv7dQfnn/G/NcZip//McGmAkdBsmcdfmpmdZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ14loml2GUle4j1jCpZTj2DUcrYcAcObPuYnne+cZX5UP7kkR
 ZJaPSJdg/5Fi7jF47WAy81W1JN2YbUOTNReDMLrYKezrUMEbdQfmCAW8BI6Vn1bROzIQ7CpPuY+
 WQHmWABfH8kDPB8HNDweHzqI3QRrIP8wzaUSg4U0CzFqURVGXuUpa01qCTbz+aVVF5ANkZfk=
X-Gm-Gg: ASbGncsmk0On5nxBlVT6WI54hPNy6xNtykO7p9Hkstl6T4zCthwPSQte9HkaJY+sYBV
 Uxw98YdY50WQRCUCqlf32uRYVrTZVF2TLWW3HNBX2ygfNe6b35oJSIw9muXAQucwm9+qv5WWo8t
 lkDGbGRp6tA14YgEDyQRMaSvt6fBD0Vrbr0L5/tVI0tbgHU4cuHvlrQ/9u5qj7fwXQuy7Ntruet
 bccI6eDMhmVHjbYw9eNL+gT6UFu5MqvNXy391+YIPDq4reDy/qgkrt9arYgHB5kjlTXSXZxPc1I
 SJN+jhxBFLxvYA/tLMzzZSnKZ/NQfkoIAb4ad4BFwUyyj6M2HzQjJ0z2FWxIMQbXgYH9KSYG+5Q
 jFljmZAYzO96Wb+Xa/ndC344jHTWFpX+wpm/2uiBZgwcDONpO7SwwhOgF+g==
X-Received: by 2002:a05:622a:408f:b0:4df:9e59:9d79 with SMTP id
 d75a77b69052e-4e2661da9f5mr51016111cf.35.1759218358972; 
 Tue, 30 Sep 2025 00:45:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECErpsVHn/gl20DmHz+69GFvY5gifpdT4tSpKn1PuYqRHRES76ncOLU7Pd8idEKbvO7WTlFQ==
X-Received: by 2002:a05:622a:408f:b0:4df:9e59:9d79 with SMTP id
 d75a77b69052e-4e2661da9f5mr51015931cf.35.1759218358442; 
 Tue, 30 Sep 2025 00:45:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37289559058sm17247361fa.2.2025.09.30.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:45:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:45:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 14/17] drm/msm/a8xx: Add support for Adreno 840 GPU
Message-ID: <r2spx7vu4sg4ydk2pvhe5gq6wxaiahmec3f5dpijvw5mseldmb@755zm7c2nv4z>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-14-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-14-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: 8Vxx0iQ0WotkvojAS2VXiwHUc8YJuCcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX0XRZb5Nves7d
 cD0qB5tWsU6BEU8BJIzIP8/77Bcp+kBofkJFyMjk0l/hQr74XIQEuGWuYTPNs5kBK8/tOG0EFWM
 wRNCIN3f8uwnE79f/vVdNLuDU95BBIqgBYwsycEVhEzlzieo592IM+8xl1PkqCkCV0f2RcpNqFz
 06DjWEmZaWmXRtp8WX7C6dUEDkU7hIfirXO+D0jckKSoCoE9WcKIOoLJzkm0BJLeXJqK1561qu1
 R3xjPcT+9UVPOkfsy/3UYlpT8Hl/KcceQAA+3AAwIa3ZYAU8YAQaK/I1X4md90GoHb9TyUamw9u
 m4LSfYEiHJeRfRQHEprtBRv/exgHk/3Rn86BM6K3CpOL61LEd4sk6gLN7ZEBLLwMNkOpJzmH8oo
 Gp9rNQRXuH7jLsTDXM4sAeJrytCbhQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db8ab8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=90rIqVWp54D9reHQgRkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8Vxx0iQ0WotkvojAS2VXiwHUc8YJuCcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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

On Tue, Sep 30, 2025 at 11:18:19AM +0530, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
> in addition to the SKUs supported based on the GPU FMAX.
> 
> Add the necessary register configurations to the catalog and enable
> support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 211 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   5 +
>  4 files changed, 225 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
