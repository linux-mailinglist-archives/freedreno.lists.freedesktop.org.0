Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38BB31688
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 13:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184410EAD1;
	Fri, 22 Aug 2025 11:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYAOCsr5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E332010EAD0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:43:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UduB025041
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tgTz7yxNUzClQiIcX4b6JBav
 BqVRBHXbupABDNM7vtU=; b=fYAOCsr5tbBL4NRTCiHeGXfBgGz55sQtMnm3YUhI
 6VNwk6Kg7J2PhtaNDLAKfDvNwfI06oq5aT0PUYIofROHRgGHr01aYp36g7QcqbjU
 rl3dor+cC1jJeVy7SlHnLWUXgb9h7LAv8lDQ+x9ZTNeJoejspD+IkcD/83VitQt6
 IY+TRTP+pyIpCi65/RgFS7YtzAuW8Erd5Z238eoNEQmpeo4dmYWNTDMqrr1JO7+x
 BpWRszdtr0wvAOpEjTrkZr7RU3u7qDRwmDtQ1mgXcMFrkI2maLc7xaLgAfHxczuI
 bXP/qrFETcSlezpbXK/orQisJmavKYIktjC+7POCI7U25Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ah48s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:43:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f562165so64307516d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 04:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862980; x=1756467780;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgTz7yxNUzClQiIcX4b6JBavBqVRBHXbupABDNM7vtU=;
 b=KnTGSlf8uoLduyWr83IkXR8qcA0web1JLfk+YF5v0af35zubiqCs6TWpuhsJ6Guq3H
 REuNAXFIBx40ufevbh1DMqGyU67XYQr6PyNrJ/sasJoka29Gf9PWW7QCj004823QA313
 uS94X2gfkupgx7JapiBrrX6da6Kl5seUo41iC89MdToaf3wpt02ItnmyGEYxwHuFj2OM
 dRDv2WnDjNCE4K5/qC4hgmZS+x0S2xptd3uZIHmRym6STqBgZAjfMLYiZNknbsul5a6e
 /7OUdBssVIjd3+Yl4KA50GUAWPT9PnQSpP+AbYOqVI6lWIGhWMmRsEvSQC5IhIaW3+Hc
 XfkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdp7we24OQqxATajpecRHZQ8J4jiFyr5CCUa9opaENszrQv8mlECfnsRFtY/8TqIG+s55wy5fFQuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1Fsj3mjzVWYRolAXLv07BUGjAqd+N92Rh70CQWC1yTwP90L+j
 4rnPXK3NGMcCwVCF1sgM2fNdsoOn8W3wTaIQn98cgezSW/MvqYqT23tTTQPmkVjgSlqVMpS20KT
 VCc8qeg8WuxJlrY2uu9d+x2DK7c3765ig8LqcTqlcKvv9awXv4sDUVLZy8td0ILNTZAjNIXo=
X-Gm-Gg: ASbGncskkYUOWO2Cny32CWVk4e09SVFezKV+oQoKY1GV6E2hKA0hhyJxAAfcKaPb56t
 hSZ7Fi2ydlbvmCGdOheqODNZj2iUm60xaECS38HVIpOw3XYCRtd18Tea7jhRb0TY91zep2rlgVk
 sGpJS6YWeP6/JhxcimpG2lVL1rlI7uYz3WsxwpCKZo16RWOwufJG1Uuvr3I6y81EjBXmJqTkV91
 kIBeJ+DUDgiKESDgBnXdxcVLJOg0WZKUhxcAQPof0lKJAQIVtBGzjJ9MYbZBBxa6ITDVDZbrmqn
 F6z0+jWJXMIB/Iz14GktIITMWiFO4PmgEyCf+WXsaXn+SMMcd+5mbL//7aIlEdY0fsOZdni/9nH
 4gC3Jjveen3pxiSgR0S61JDrU5/bol3xgmBPG/2mNL54wCxqeUwJD
X-Received: by 2002:a05:6214:c8e:b0:70d:479a:ca6e with SMTP id
 6a1803df08f44-70d970cdea2mr33545856d6.8.1755862979975; 
 Fri, 22 Aug 2025 04:42:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdRz6hdH7m4nOBMkuiSMbEeU+mfLZWmnffBKcn1rd+5I9DQW3QC15nh5Lpj4VpWDwLhDkI8A==
X-Received: by 2002:a05:6214:c8e:b0:70d:479a:ca6e with SMTP id
 6a1803df08f44-70d970cdea2mr33545456d6.8.1755862979349; 
 Fri, 22 Aug 2025 04:42:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a44b538sm36210471fa.26.2025.08.22.04.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:42:58 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Message-ID: <g6fwzj7njcxomwoze5phbyt5xx24s4aeaxq7x64qe5esanabix@okocxeysh7xa>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cYr-4oNc9BZhAKpajlMXDxec9X4EdUyY
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a857c5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lIFQIvOu6nGuaiKUdkgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cYr-4oNc9BZhAKpajlMXDxec9X4EdUyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0yGa1gkboakF
 64fKDI6bNK+fF6FmDJxx10Kt19/YwkP/bxERKVptzUp6aeO6YzjNgj/hPoB03H8ZRmfggHsu7W5
 Ij+8IQBmtkJLTDTnjP8WQcPNOK//X/bdWvjZqYIvW62H6IrszJbbJB+s3ODrf1vVC1E9gt6X8jE
 u8d/+jzSX7Pe47n/rrEjSod0F9tryo40r3mIf1A2MHrn7Fwx5Gxhd29IT2os+nHfSnEKNYrC+dL
 ISwe04skF/Fu9oFIcGTfun8cCJOmf/lFRyp2mXfEw8zOpNG4iDeOR33XyrGGa5ilLGM4gov5mmv
 oROIlehcaeQH3k+ZxTex/hAdS+Hd1kWx/d+hK7Pt94ADF71RIiuYv0V1MofiOAhgNY1JkrooCgq
 bTtDIni1zmgfI6D/7l282cSFgMWBRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Fri, Aug 22, 2025 at 12:25:31AM +0530, Akhil P Oommen wrote:
> Enable GPU on both qcs9100-ride platforms and provide the path
> for zap shader.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
