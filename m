Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2EC85896
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 15:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733E110E41D;
	Tue, 25 Nov 2025 14:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzwYKouo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTED4vNn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C339C10E41D
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:48:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APEY6eO2726775
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2J63HAWT/xBRSAZdQdUSYuIS
 IPaqDrp8aGKI/vJREVU=; b=QzwYKouo7G2xySngcb3N+7/Ui5J6y33hstKhvQlv
 2BAkWnNKYblxvdEFsOaWMIDHmpO/6S+Wje2gxz+0jmV5jERGCuhVSWd1r/yJGPo3
 hVoLWAOcoyqv8kdnFLwCHUcDkFE6rjflSxmhMVVHXBe6elzj0GD20hnoZV+3PQ/j
 LP6jQoVQdePeciCalOaMA/HJtG3kLHUZnzeGvnpWXBh75AINV2KnrHvsq/31u3v+
 Lx7obMuoc7ucQBIRPAiYA9fXGWuQr4C3jU1FcDe7kfsqIOc4Jm6GBEvN7384LytQ
 ZAqGgZVI/P7vbGWOyG5K4ZYTqHZ/fsMokQhLrjwaY1upkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvs631-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:48:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee3296e984so116150551cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764082107; x=1764686907;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2J63HAWT/xBRSAZdQdUSYuISIPaqDrp8aGKI/vJREVU=;
 b=PTED4vNnVI15a4slvZxwLbQxrnXI/NKuND4iOev5z3nkQfkNhSLLizaLNMjFRE66Iw
 jLAwecNVR80IVoCvIzmFdiLZhBbIyG5fibAizsPfK0GPuJccsaaM21w0YnA/iWM/dT1g
 IM6bTsAIwAGezFBQfzZypQgvrNDPz26oWNotirD4QHiP1ghh78t3pE8htoIRL2KPv6/d
 /P6EARqFbM2aXLzSFEjUUvKZMeS8sWE0DkyJYVlj6SoHA5HUDsz5yaw+2iidF6crfcFd
 9s/B8ZttvCSZ27mmtjfXKCZ2nrAG4JO+kKiXus7zQOcn7+MjUoiwiwDsR4oJCxCPmdSM
 XpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082107; x=1764686907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2J63HAWT/xBRSAZdQdUSYuISIPaqDrp8aGKI/vJREVU=;
 b=fmPYAeomPclYcKKDno4AJqYQxvZX/7RU7jCu55XXUZ893mSMCbiOi6Ilwgfj7IKwtM
 Ww+0MWslEIzQdh5avuvDIhx7MpujROgoFI7VAg6oqEPthZ/Ak5UPmOomlut+PHIYw1tp
 uphFHiGODiNuQRd/ax9ySos2Z/D32NCoD/2C+AK0FKIFKizxktVMDY6WYVksFA/RBRF/
 /tIRyqZzGK6WYw0T8o9yABKrN7KA/IjM8Q5BZabaRCvr9+9iJPGeCmxrvU+yxrBGudxx
 cfXISXaNa7ew50LWxyzKmM00YimfRoNEbSY+gTnCTwhaj1HH9wqQWUP3lLMDjoueX35k
 OTZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW06lvPhUayTDJqOmwExLVqujL7OYPSNlJ/BUObyEoZEoZQDMsDgySr3CtUmivjFffZfZ+mB3Mk6dw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQDdaqYWcIVoXj9vPftaQC1mh2zidLad11CGyp9FLYwl+aeK9A
 A2e2EYZG0lcws+Lfry3PlXX7thkUz8GzAqfrJBfUvnZE2xOqxe4YMdJbUky4aMG1GUH6B0D7dDc
 IOvNEzwFlk84cF9QiBXjNSv0DFcAnEbH9YJ3H511/wENSvNZnz7wwmZpMp/J1y5J3xgaSyvg=
X-Gm-Gg: ASbGncsHJWSRSRbDeAf9kNXlMtS7ihPcbxNua4WMovBeLGVdm99q4cNFwDZbcOcprJT
 3pBRLH2gMXYNeC/pXb0xB9QtBSy/S5uoFrVVI80AAhXl7A5QV9hSs8TuXbBGF5Z8iN6hiWF2GWf
 c+wd8qBG+MGjkK/p7IjL9eqmOoObL3WWgowJeWLkhkYh8wr4z+qqpyw+qta9e95oH7FYeJMftjs
 y6QXOijfNsdzmXus5iyLfYSUSliufxV8xH8dYhdEsOom5tJIcNJcju/aZ447ajGP1z3PRLQTVGp
 7Em01RgfEiJyRlROf3eIYGAe/xOpqu5g5XGocaAvW3AXeNJ0qlGrIRG5GQ8ZQnIh2LlLyWI3+Ll
 74K97zC4nkvrg1Wjt3jcOiKkTm4gtr4K1r+g3VGu7lJw7ZP/FIDGI5PT8wgLsIYdY+zjS4JqbJW
 Hw1ZM7kbWk
X-Received: by 2002:ac8:7d94:0:b0:4ed:6e70:1ac4 with SMTP id
 d75a77b69052e-4ee58911639mr214711371cf.42.1764082107232; 
 Tue, 25 Nov 2025 06:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLx8aIX8BiCbNvSxqGqHKSgfTB/Fws1bzqBUnUGjst6JC4+3XSzRzlcwUpZfMZo/EmN4sXbA==
X-Received: by 2002:ac8:7d94:0:b0:4ed:6e70:1ac4 with SMTP id
 d75a77b69052e-4ee58911639mr214710831cf.42.1764082106732; 
 Tue, 25 Nov 2025 06:48:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db88f71sm5302737e87.34.2025.11.25.06.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 06:48:25 -0800 (PST)
Date: Tue, 25 Nov 2025 16:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/10] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <syfppoocftklfe2fqkx2c6wwanjuikxc6tozybc2jvfrxfbf2y@n7nmho57tuvk>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JXB2neQuuAQIl_0XNf3CZdjTiudNMfO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX1YwLnxJYKio/
 Fw6S5SXgcovKt3XrqIdMbyvlTlJWrm7y8GwA08BSgro/S1YXG4YPwdLSHldZSGVWzoJkgCVotwr
 Pyze195POBlsJlezaZ+eKzDSlJc+Uzo2+WpRScMkeJO5Mo4e9ht9fqAhtUVHOdKDmykWJxqLshC
 SZGtRSnUrjUw65Vn7CewYpOu/QIYB959oY0JizSq7Rf0kxK5UNDdWFNSdDMuOG7TimEmHNUPVkM
 J67FNnPnbDkqQX4kSrfOWzCLjsXUr9/cJusVlq88SP7xouU6VIWxWsa8V/hzoqs0q0+W2JsCpbK
 +omsDicUaJxjodUp3jbvD4jWhuLpTwh0p9RLAJ/nJG6BVufTp4WkAtsW9N0viq1y+K2SjbGJPl/
 rQszV+iq27766BiFwkEzGz40DmhCIA==
X-Proofpoint-GUID: JXB2neQuuAQIl_0XNf3CZdjTiudNMfO_
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=6925c1bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nXOiHK4lao4tYTmu_wUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250123
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

On Tue, Nov 25, 2025 at 02:47:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform, kaanapali introduce
> addition of DSI2/DSI2_phy compared to SM8650, However, based on the
> HPG diagram, only DSI0_phy and DSI1_phy works.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
