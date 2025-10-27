Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D67C0D837
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 13:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD51410E459;
	Mon, 27 Oct 2025 12:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvhJ+CqQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AC410E459
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:29:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8gUTX1052123
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/rsr7uUBm8i8kH7yFAmBlcni
 G9FofbwGslfcQG/PTJ4=; b=kvhJ+CqQOQkjPo2cVAGfDsuL4HWLYOBffmy/ZTgH
 Popr2gHEwj4bIx+0dYTh3nhDAn17krh++oEtWs8VQsk9oYQ2HNgJtgRdwd5j1Sgx
 6qJmwJynIz4z4Xj9dkazjaJmK1pEwMKfD3d2KxAippn78mA18EW+ZNyB+koL0Tg6
 WwHLnn0zwUpBaltFe5uENtOWBoYPVsBZp/Laf/+v1N+DunkUPbsJpgY3YJWb3zlE
 TFL0d/zeKdgvuNcruDqa8BbVIQmVFx7NP/Orb9h51nfAf1jj3GUFuSSpLoxD9Jo9
 8SDcaCpND7fmYiOH4kaL01O2KLjz6qGqkJhvWXVkRWxf4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1sx9h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:29:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eba247f3efso53740361cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 05:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568147; x=1762172947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rsr7uUBm8i8kH7yFAmBlcniG9FofbwGslfcQG/PTJ4=;
 b=GzBpOSr8lJBhhMMU/gkhEW6YbtdCbH7JpohAZHX+5JKe3PGMHTSdpRzcAMO0qFab1Q
 sx5E0TyhTg7S6PNYiozgDMYb7k0iF1df+YqoIFweRQ2Rdyuav4XQbOmpvF09ieMZ9Fu3
 86T05C+5oorrXVu4rOpmCDfsxZntjSOWhcffV3yw9R8rhOH3kmA5blB1yOZBqTH0tLOy
 I1+OnMNkQHMZ6ZtVuNBeJUabPthdjVhPJ222az32ybzcbb7oBiLC6mDOkWKAA1pqPU1L
 AY2aNqsW0ZLNFLYUlpCivi1dAIPl8h4mQK/XxwORWj8GmdYE/9v9+97DGF/7YTwPIjMf
 hqEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmGZ1JuqXzEevukUXhQNKjoSYUPTnWNwHSOYA92jg1xpAngBOs0XXeJbAAfoPXtbu9N/Oas3WKNGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG6ezgYRKtfDhs+xLSdmvoPmEu0E8cCcU+LqS18AcbDtL6fQDO
 bN4qE5SJCUba6DIewvyaE12ixIiiggXjCN4lbnHgKyWBKWCklBNe8sEUmIvrijNmslIEc/VCcY1
 Cmo73eQi01hLBDAe/LvALNkVvEsxIn8+1aDTa1prlwO3pJmyyrozRI+NEy6JBKlzv/6OzoFA=
X-Gm-Gg: ASbGnctX4xhjgcYhJ5UpkDEBZtC3R8igyScXXxsohWGaem7D8KwX7B6w35nHXZxj96W
 u+Hase9fw7C7DP2MukWmLoBqA10cfV1gNJ66dDCi2wXRMjAsObEHOBmpGvcKheqJClp3Nh5VqrB
 y7KM8OVqQQZs4FBjDGuCz7uygoy3n/sq4sa2W2wNo2+KmaD7EVAVikiD40H+u0fLhCDwT4ktFem
 fEEQy31E9QMm8F9ctSaWKfe9/Ujwpf+5sbF/OGm4PER+kPDY6lTKw5HOUFj9DR82TDXS/Iy58K7
 dzcZlgtKrbW754f4k8/jKwuVz/qCM16qpdC8auvQ2nWbbsJnExEXfHnPf5d2AAWqxBMzLMYhVRZ
 X3aMzX9nfgsjHLG2d3EuTngtA65/kUjLkZBDler3HJCmsWcIcZJICwqujrlsdUtb0QEm9LzsQVb
 R17SMxVG6xNjIC
X-Received: by 2002:a05:622a:5a98:b0:4ec:f3ba:ceda with SMTP id
 d75a77b69052e-4ecf3bb1e3fmr44759711cf.65.1761568146653; 
 Mon, 27 Oct 2025 05:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbAPmmSvzR7IiPpq3HlUcctfPxA/tqwPBS9g1DPUfBmIKxr6HJf+bYxHzHjkN1JS0U1LBubg==
X-Received: by 2002:a05:622a:5a98:b0:4ec:f3ba:ceda with SMTP id
 d75a77b69052e-4ecf3bb1e3fmr44758051cf.65.1761568144757; 
 Mon, 27 Oct 2025 05:29:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0a56ccsm19486411fa.22.2025.10.27.05.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 05:29:02 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:29:01 +0200
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfX8zisDjKPNH2B
 7lOc23d6GiYNdWoRO6/rzpzjAyrdUQzg1FUUh0hYqrzGxmn4jGw8yenuRc2T+J/RoPyFEBBR/9e
 vYMg0dCiqU2siogzm0Friyhi0+RD7iWGbAGwf8qjbKqZIB4zrCvUxAA0/QTmptiIxfhvxcy77bc
 dQDkegFDSQ0ioYBBX9WGh/fl6uaJd4vVOPmjzjuKfHanE1Nz1TOGa7eEiwS993jkd6293nfwZeG
 H1/EZEbsj6G9bSdkubkeah66ZP4UlqVRlqoVogPGcOynh7a2WWdSd+rUFY04PsMGgb0GMDJ4QFy
 FBTMuQIJxHPkPPztEWhHXw2e1fv1OEZDrbXM8xghwgC+cD27SiGScANhzeRXrLkxAGlaxh68Glg
 xZ6ROHtDrJLF5vXc7GBQb/F/Dq99bQ==
X-Proofpoint-GUID: V0kbwFoYjXfNxi5kvJnvlJ6S2KoCqHt4
X-Proofpoint-ORIG-GUID: V0kbwFoYjXfNxi5kvJnvlJ6S2KoCqHt4
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff6593 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=rYq5acLp8HI6pBODZ1gA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270116
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

On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Bjorn, do you indent to pick up this patch on your own or would you ack
merging it through the drm/msm tree?

-- 
With best wishes
Dmitry
