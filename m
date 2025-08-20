Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBB0B2DB86
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 13:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8A510E709;
	Wed, 20 Aug 2025 11:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+ArhmI1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257CF10E705
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9wSfD025245
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=75L42tl0MI8KDN3dC/5xm80p
 bNugX+cDtHPbn4TsTaM=; b=f+ArhmI1e80n2E11S0VAGAHBmTj7HCLAeDvtlL56
 +k4LpOIw3P67j6da/lsVzoHX+IUnXFXe1GQ1pdLSdyzZNIWh2S5mDJMJXbxxAGx/
 3HtprMmldnr6sfITJY7LfmQwx838XN2D+yhlDylMSYdOh4mkP0NqzRllWF8rZinS
 Pd+IXCpQKKojyrZDd4waTrWOVWtOPAlVlIPrT1srooK9IcXftGSt+1mrG6RpfH06
 KiNEJgkUWbMeaaUG1VzwKUp5aasgESdXV2uURKnfRWWQLhZlEze7EDRAVXH+EqM8
 NNjCp9eOQY4JHk5n397t3haCiQQsmELZeY4aBmcrgFgfUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291k4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d7c7e9732so8594656d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 04:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755690384; x=1756295184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75L42tl0MI8KDN3dC/5xm80pbNugX+cDtHPbn4TsTaM=;
 b=S7iHNWBo1Pz5XzeEHjcyqsgyCIn3GZF5YON3e1rPRDS6/cHUGVygH6ZL8CkXR1SrQT
 O5MuHI074WBswcWq0AsHxmxHfZEES+oXX3FuT7m856Jeio91jjAfRiwdfzBxOr7b2xD8
 eUCW2O+5aGouBDz6yczwty8cw8w6kOXPBx5vVjWiMr5ovG6cpmJvgQ/uEXevkH0Dwgrb
 BcZB71k/UEBfo1rcZfij7xBVwclUbAi3aAtYC5k8LqcGZuyBQNhYN36nqLLHUiZYu5f4
 c2Ndl1VHct0I2Rnqfm3Sm3+v6ApSEqKq6HFZ0sktecPoTcwC98U8Wp8IiHmrwH81lRmN
 SGiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4X+q8z3XgS3UtbuDTZHe9XpclVxpPMAlcgI5tQihYwJQp2F3zfY4ne3D3nl5Y+W2JRbO1r+77W7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywlG9MNKWLVOnSSKdqGWL5/VFaYjFfYWIBc83nfFI/39QQT7+J
 Y4ILzdZlRCmYg0Rd2jy8rUHUMUw9C/e4ITX16C4JLv8sAEucC9qvxakq3roTvaZb9oMcJJAfPV9
 bZhGmjytGN1edBf/L6fPiQSvVmc5/O62cFvl2b6W5eUnwVIzwBB5EqGdMOMWvk9dApdHHdeI=
X-Gm-Gg: ASbGncsIUFWSvDsQK1+P2tJf1nUiC4pc5dz/W53Ed9tdwNQorxxhvYhXbwkAdP9tNNN
 WWk2m8siAGxvZNaJw5Bomm1j0oiuYB7l0mCas+gJRHQBnz4my12ZFmKPWwOIXSFIQ7Aav5Od9oa
 ZfSG5OO7fTc+nUwNgQhongjtDpU1P/VS2ek8YpQOls4jglaa9l25ha9hiuN9juz8SVA0jFR2sTL
 bVSmkZBrX4U7puuim2L2SwIRSq2hcCvgLSt2aEhBNvd/PLETEJCBXYOWfZx6fks+9x97ZBS7vmj
 CS7qV1oMZAmglftIBOr2flBBWnQdiRGQ8QGaWcDy5OvJMPvvatJoPWQC3V0aPm9mJISWuA/IaL2
 UCtTpRSDDxewR5wlVVupeA5D1n63ocoDETP06mlUPt4QR8ASdnHX1
X-Received: by 2002:a05:6214:5194:b0:709:deb2:3dcd with SMTP id
 6a1803df08f44-70d76fd4c15mr24701706d6.25.1755690384281; 
 Wed, 20 Aug 2025 04:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH83ZZdKQ60Ug1Lmf0IPGuUmaz4M2F4mxHsaVgPhdq8EvO/IDjNwV6zVABnr6KJ/OabGfXT+Q==
X-Received: by 2002:a05:6214:5194:b0:709:deb2:3dcd with SMTP id
 6a1803df08f44-70d76fd4c15mr24701406d6.25.1755690383793; 
 Wed, 20 Aug 2025 04:46:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3525sm2531156e87.108.2025.08.20.04.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:46:22 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 03/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
Message-ID: <ay4ss7cwpiz6zwiwiav4ts5hwhxjpc6ogc2uirwzfcyhi2crln@3azxsu5hvyhy>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a5b591 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=H4SNA-w7Ihemelo7scQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: YelCCseC-lUqB512-5gP8B1B9WyGEqpq
X-Proofpoint-GUID: YelCCseC-lUqB512-5gP8B1B9WyGEqpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxHPjpJ4b/E2h
 toWw0tpFWUxZlNv/1d7919iIRF2kyIs9XylDc9iWhS6jBQQgMX/lXZ2QqFgZg2kiV4CHNrkiwQu
 faKGNeA6G2R6ZT7WF516bpB9JrTCtv3Q/NYr8+pVnAq/6EKq6mXtWlH6dBFPprTwTBgn43h9cxK
 Khm2Wq3kOktNkmVKpy4fetT2vIQHw0gr4Anx5DglEhv0FZ3k9sf7/OPKqMHzgJaudxFuyEqRGVN
 rqDjE0UmWnw0NvLYmCw46YoeRbIvr2UO7YRNu/nO4OO2PzjvlH8EtrdauP3dvNzi+GdjBsXb9RY
 8PARKNt3/qXLKOS9oFhTSz+xRnIQOKkkcTdApdoZ2vvzsSFI5yqAG0M608Eos08kw0IsPVu4tou
 47+FilvptJuEeRxOfSi1uFkWpq20cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
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

On Wed, Aug 20, 2025 at 05:34:45PM +0800, Xiangxu Yin wrote:
> To support following DisplayPort (DP) mode over the Type-C PHY, rename
> USB-specific functions and ops to clearly separate them from common or
> DP-related logic.
> 
> This is a preparatory cleanup to enable USB + DP dual mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 50 ++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
