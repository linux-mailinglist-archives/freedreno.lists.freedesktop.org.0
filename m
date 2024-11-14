Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88069C8BDE
	for <lists+freedreno@lfdr.de>; Thu, 14 Nov 2024 14:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5E710E030;
	Thu, 14 Nov 2024 13:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZhoFN8X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EBF10E2A1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 13:32:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6Rl1q026972
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 13:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=; b=FZhoFN8XHTnQqamd
 /nxIrUWsU75YE7NaNRGWURwc6SNDOr5O+9kglMUYMyC4G2JfngQE+6DSXgnneyQx
 ToQABXWo1khb5dnCT4ZMNOt4pK9t0NYqqzpZDRN7s31+vGRu/Nh55lSv29qWZbyA
 m+DaHkvTGiVGsfquypdYE7OOQRSMJweOXjaeYqIgBxMILGAiIkoO90X3goz/I3BK
 2WaEnki10k9bbEi7uF4+OFjRYp0AEoM1+SliwDUDeGPHxY+0npHMRTk/rz/WxvMM
 RJ83NoV9htJbOyz86YgWTkgz0GoYHs0/bU9dPb5A2acbEgZgHalEnH0gqRmuB8/d
 LRUO+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vt7350j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 13:32:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6cda6fd171bso1380866d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 05:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731591144; x=1732195944;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=;
 b=G5nxx49PUGZ0lusGlnQ71ChA1SAx7RvFKf3gHDgy6m2WjnLuq6b08qnAJOGzOca6BG
 Ha3QnTPH97h0LMGV02Twjb5uTrJCoPIPObOkynE4cDw6BACxm8GjOdLvW2eXC/ISIKqh
 hB3ziqu0JGfdFMhsaRwLhKD5enX5VZ1JUOfjhP6TwPRwaqOAUesRuIrcu2sEGPlznIz/
 0YuPn8mhe30rB3uBBlLTTNt3r91wsjcjmejIgTkRIjBf1IbAFo6zeapqE/h8IucO6DFI
 ViM/S94WHVlac3nIlYNSikf6WEq+Nyb97Z/8R2EXbfiP7FbH9JAJaQOITePYSoJA9pAg
 +ABQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFvUXL49NJiSFCwF/slWPn100zDLOrgUoyxl8V6+spJkNv1zlB0PMSikLLA/VmK2jNcNdyeh0iPdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylf89KEJEsYr/+/jX/MvxlY0RDwOdfS8fMtjfOx8zi2X/pgPnQ
 oiBymz6INcCs/3pdWjQ34ZPil6AHuYozpQmPbOI8LHS1x+GMSiduHyXxOa7/NRa2tlga1zHjYT8
 Ys3uDSxTjgEIKl6cfceGg8gzVxa2+v6zE3xc3LIZKF08+DT981/g5s+QCcLRm/NW3kd0=
X-Gm-Gg: ASbGncvfWbuLLUPuuIRc0FRxZwzYZVB2/zhPL8gK21HvslwivAgbsGvTrIBVhL+3gtu
 Rjg+XXb84FRxdGwWHZrmnd2+3YZmDabBa++boQJ3VmWoa5i+vueQ56A35aHBlZupb/dZgT6Remc
 +6GBP4KJL3GLtlcLDeDFDVrPcKRs4N69vLU0eYaoLu8LOrvDOoAJQGrh6vzgXK2iAXhLmiemwLi
 GBHw13FlsGWcHpEjBo/G3z79THRCtkOrE1/jPhtAzZriD8sXZ0XO3FfXvxOp801igaohyvhuV/p
 Rs4e3bBZzqmaqEvxMwQ0OVOrMFttkI8=
X-Received: by 2002:a05:620a:4415:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b331e4ee53mr1277583985a.12.1731591143582; 
 Thu, 14 Nov 2024 05:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnnkk58laYKQusb97iyKgh+0oqbjf7UMfJRyrL+TYbBL3HaTdZUyxFrlTIeOPllvNOALq0Jg==
X-Received: by 2002:a05:620a:4415:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b331e4ee53mr1277581185a.12.1731591143140; 
 Thu, 14 Nov 2024 05:32:23 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e080a90sm63884566b.174.2024.11.14.05.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 05:32:22 -0800 (PST)
Message-ID: <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B0V0rQFLUKSo6qmkLX06SW0-uQBA9zzJ
X-Proofpoint-GUID: B0V0rQFLUKSo6qmkLX06SW0-uQBA9zzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140106
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

On 13.11.2024 12:51 PM, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on QCS615).
> Add phy configuration for QCS615
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  5 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },
> +};

I believe refgen is also present here and you can reuse dsi_v2_4_regulators

Konrad
