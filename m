Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044CAB20578
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723A510E430;
	Mon, 11 Aug 2025 10:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMyw98jp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D797310E42E
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dCAK029204
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=WMyw98jpN7dFuV9+
 Yu15OlRj+5Qv7PUFwt0BSU+6s6tZycYVWK/ruJYvkkNgbufHn3KH8UK/yMdoMt/F
 YQLO6mOKbEqbCWadvtBiTKhka5XR0Ad6e1evnoPxHSInZd/l/gb/TUroqcK0T8lt
 vuZn5C7x+86jxq+biDBWIlpqjHsgoKlEwbA8hRSDwnlrOt5XKc764sYiXru2E6BH
 OGzNVvMvQlxPQnYbD8jedvQDZgiwrEri2wLw8Qx8u3XXteytA3tFBgN2F7tosxQq
 CJ+4SnwmZM32zOuMBzpllDQWfMExHL1HZ32Fwcv8fwwOp8t3RFq+NpPwyMCguUp0
 UurXzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sm4pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b071271e3eso10786121cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908427; x=1755513227;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=sluOT11XYnl+sygcyzkYiGrkOCK85gsr9Wno5D9xAnTliv/J6tDtWoEGAbl1AekTM+
 Dp3+x1fYkUMq2Q9ibrEb9d6YnzDLhXCPi1b1SGldlEwWmD7bPZMXRWuM+G1pxzBvpURS
 BpDHQVH8X/j4pKv+chHDo+SlFVDYAqyzbc1fgKLbdZTb/6kmOXKDNDeuqG6lM2DiImM2
 dnZmFREojqTw+GbXCHhsKYmRoETGMI6W8jNF8KP++SY7GCr2RgWE78EziWHJ9YChUBOH
 gdf9iqBBUaXhQnUWX4jwYlW6ZQUF94kteX5vCNXrd1DlIheI615JBuxdRe4XwBWyodgY
 rhAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRzQMG/eOtR8Yz22fyxH5PUIGZEHvvLmUv2foQlKxpl6xXiZ58fUTKU+EnNY2Luj0/WZ2Cm6JVgyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7qrEj3O2//FydMmLdWnYqZNkmBIVpkY+nTHIw+lTj8AhTbUpJ
 RZ5uDgia/ri33PZ7L84ykZzzzbOyMOoQW7rwSqVJXJbr8Q1JODaXqCn+A4gVYSRDEjqF7USUTzb
 sMbqH4UgVrS+t9qLhoWWgc/0LC7Bwbxhfr0EfjG2y6ZoREu3aSNZhcGvxF+K0Wa2AxyUYc4Q=
X-Gm-Gg: ASbGncsktxUjDzvBRJenNvawLsEmPR5QufdMr4ojhdqebYjApS0oKTdncHR0Buuypr5
 aLtzrF9MWkXWAfITjrM/PmvG9WnsS5OjOE5W3vPecP7OOIZhWla9mDB/mg3qZltR2o70ZAWlyPg
 Mp6KDfJuKK94kP00iBgFO+qOyeOM+eZfY4MDJjlZ/8ABEILIJE00WO4+tkHbR4ZPAUuNwAV/fJW
 msW12Qv5iTG9AnBS7QD9ADeLPa8EEIsBIV4kJP3t093qBaLO3r5holw8TPsbQ9D2OlY14a0i1JQ
 N+Mkz1d21jACYjL/JdET/Pr+svr6Y5HDKSptmDJ7wL6pEB7T8a+HLgzhl/Atm4aYmSmkTrMWYN8
 8599cVieYvSFlwk0Vpg==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b0bec78c73mr59284361cf.6.1754908426873; 
 Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7IhssFNIcGhOq/EGToUOu4T70RVm2dw0NQGyrObWdTLIgVbBy5n+ITh6LfbnZCeVTNL5pEw==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b0bec78c73mr59284121cf.6.1754908426385; 
 Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:45 -0700 (PDT)
Message-ID: <727350ad-720f-4751-8348-15914072ddfa@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899c70c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: k_5iP_A0fKuGo7fr70gX_K_nNmqLmA0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX84zGtZkr7MN5
 SqcKiibD8X81VXHJIRK4Rls2M9ZqTw6t7ymWGbllVT6n+0prMr68+0/R9r37MCoS313UECdwn+k
 R1kTvD8ivrWWdEKIYDt8F28JkjLNYRqY+oUYLX5M0aKZrcZig808ymrassnNPuNrtRHvaGO7dqn
 Ayw7BHY8C5sCJxRAKAokT1iMG5kcmDv3qS2fE68U7mWrPKt0GiQ3ZcUIac/lqbmg12k5bNnaEtt
 7jGjEO6Cj8JaGidVxpsMrtiTYkY0ggkueox2PnQpynkA9wZnm5YOr+mqVuVqe0OhzQNsr72289i
 o/0Ac6qUTaJm/9geCHFZoTk0yiw+M2BH+/eF/y5V0mOpEM8lGTz0RSNTDe3sIL1IU6pXW7MDHcE
 BIauw5hg
X-Proofpoint-GUID: k_5iP_A0fKuGo7fr70gX_K_nNmqLmA0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
