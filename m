Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A6BDB1D7
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 21:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFD910E238;
	Tue, 14 Oct 2025 19:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFhYfeFz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608BD10E013
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 19:50:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EG5jgB001741
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 19:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hoXaxxAh8HM/NnL2U+whNfVg
 Ynbh9JZ3GGYiHNKdMQw=; b=WFhYfeFzTO9webJ7RVqkMZsclTvhFb+CfHvDOT/R
 GATWvzYy0L23twFn/CAaFdL8QwkfRZ77CZIoeiYSX6d3rTn2zn4naA/mWoLCb7N8
 z2RX3Dw/WocYxrfhlwbERqirPMwpAXQ8XyIMVQZ8Ic/e+eDDOn/T2b9sUqbTsZnI
 XHSroKWxZF7KHU3ijsYrOdRHrM2iICLGpUlxPhQg3KiREcQJaRIKpelWOrP4q7+Q
 NzfjAhgIb76nPJBp0XADW2qgTJe1XMVSJHP3+LE3+k53yKOuNf6xztMfHTOeKRVw
 fNc+nd75ZRMTWLdUoLtTSOYUfw6wWz0G/O0nuARhTEXW3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk9smd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 19:50:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-872d2ad9572so2943295085a.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 12:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471423; x=1761076223;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoXaxxAh8HM/NnL2U+whNfVgYnbh9JZ3GGYiHNKdMQw=;
 b=UN1Nyf4rCNJdwvT0+Qtkymzr7DRAZgqwGrKt99kr2IT9LatTl3ZGu09rfUI3j5Im4q
 Y3OGZo61AfvoOoBSj0SWZCHXmvQEM+6DYKJzsRdI5hSwmG8T0VrPwW2FthiETdExxqVP
 AdPutHchuiZ5bz/eUfItTOJzE2T682PzgVg9D4E7Oae+SSVk3CyN1oiM4SdqxsuHQhb+
 TjHtB28ZikgIsdLm4tp1XR/QF1cuzrN1cGZOb7SRIUZU6vB1LWLqYC/ia70GQSR3I0p9
 5TmdT8LYkm5rpq32lYtLFAH7mTrihPPgF9f0/CdLgQ+FkaRgdcbCnapy/ZJUymNmLo8x
 LT4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgFO/h7W/eDL8gyv0vD5kltj6LJFTQ/aNDSCYZaQAcRQSTMUfWYtgV9vSGOTxWIezkztADnejBk0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzHyR6OYoGSJSPvwy1OX/b9REDLeAiB5zgGmsRW5zl3WJX+E7e
 3DyqPreEfIizyuJfAx/odXbWUTvZ+mCGe2ZVuuTt8r1CrZs/WAaV9LM7etxs8zLb3NcLV45FV2P
 c89FG8yhpA9+0o/tkauKF5g78fW1lpYodOg0m9i6efGlTlkhh1h1LrjCjKvlXKKOrSxxZBo4=
X-Gm-Gg: ASbGncvnq0eHGcnmVxG6UnDTihAs9ET5RIC2S+uCUbyb1vAFkdiUcnCMD+zW1Id7y2b
 IZBSNGe+b57zsm5JZzo8vYtbyfCKIRa3jrnPIWJ18Wupz3dOdqJ7Do0GPEYhdbn8ivZ1gXucexk
 6SKzSY1DcomX+Eok3DMZaVjtu7TfTA6uA3QpVjODsoT0lZ/ipuRKwNqkjgvRdbsfmtDvLZaAu2T
 y9ueoUTpuwt1bx0X5SMHM7EBjUEtG1XC7ZUclD2yEilG1KDBfyv9iTKFkfhlViOAPRa/AMc5b5z
 vZ9ZKvzJuI1BqP6IENDRP4VFapowWygQDm8oeZGXxCXgikLzKFkXfuQAEv+dAcw/wB5o8XQ1KMe
 UDRKU+7sXfkkSHVsFp70FWfd0FgseisOFV/0LYmw1oi613hLND9jW
X-Received: by 2002:a05:622a:148f:b0:4e7:1eb9:6075 with SMTP id
 d75a77b69052e-4e71eb9639fmr134514471cf.24.1760471423527; 
 Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5E8/aPEwYwGIvty7HBIiP6izQb7EW36jmKnfvDtGc+uFowF5L0vJTo44+JikizgOXq93qFA==
X-Received: by 2002:a05:622a:148f:b0:4e7:1eb9:6075 with SMTP id
 d75a77b69052e-4e71eb9639fmr134513931cf.24.1760471422969; 
 Tue, 14 Oct 2025 12:50:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4e09sm5522722e87.23.2025.10.14.12.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:22 -0700 (PDT)
Date: Tue, 14 Oct 2025 22:50:20 +0300
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
Message-ID: <f4yvyh4yg4mjuukxdee3pdxcslucj2k2icqc4d6qfzzmctlffn@gxtzhgapvnv7>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
X-Proofpoint-ORIG-GUID: 2JhlkpVIky7ucdpqdS4mcBY5KSQPjTRw
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68eea980 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rYq5acLp8HI6pBODZ1gA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2JhlkpVIky7ucdpqdS4mcBY5KSQPjTRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7PuxtNXuMf5V
 hPlGn8EbfqFbNiFTnBNXXP0zqRB6eneD/DQz1GRol54uL4rDXGU2sQrt9dgzNXSop7vu43GNcpl
 HHfFqihqnC9Iq/Z/SudAbNVc9zgkM3S16FixbG7ymMLFeMy737r9u7AJ1he98eXXWhNM2nMJ4Zb
 DNwMcLNWuVGASchEnOG4C8d1yzPu3Dk13ZH9OFnuHYRufseiKSU418WAXkLVbIUqfdEOHFa9QT3
 0v4dyqIpKJDtBZ/4wNkRRxN8V5/NQRDj53z0eQYrHi4yWKUAbNLkIPbH52GWYFDoyyeXl/YsA0r
 Nhi9h3WEUiHkhybly/UYu6VdLWbh8ywc1I+F6mZHdSjt0i5CAlmhHshe80nXxjw7FGayCnzzsDs
 PKVlwG+lbTqprttXlAm5mY6NtU1lxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
