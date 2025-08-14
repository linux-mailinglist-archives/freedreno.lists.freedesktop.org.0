Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE126B260C0
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90A110E296;
	Thu, 14 Aug 2025 09:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="InNM54pB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4371C10E296
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:24:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMdUGN012161
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xhD76Y+LWnlDk3QMceTS29ieyClXA0Qtf1FA6Xtw2+k=; b=InNM54pBTN9QGN2P
 nxyICmv6J4Kp8T3pCQzimSHEXWX3z3/Lc3eXh3LO+nK6JS5lnTgZQCGDQFbt5W/h
 arVNfr00CsKpHTVIL3Z48f/ONEp3hgeG8P1ax17ratTLrBYK+6LvNQFtfTToCap7
 VvRkgzn/ZUo/D3gT7dMpzHWfMcZYkLWY5zQGoLZnYBbHrC4mAwlxjy99XM3QAo/F
 nhbdnuBCLzj/nrSncUM1m3nqx4he0MbT2XskBzxYeHiFp5LUkpU6FzbfiSMxtr8R
 zZye/3rN4vFiGII5PU+o+gqyJBixYejdEVe7STUX/9v8goZkwlje0Y3i02oQEeFX
 YP926g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9x6t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:24:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109be4724so2920841cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163487; x=1755768287;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhD76Y+LWnlDk3QMceTS29ieyClXA0Qtf1FA6Xtw2+k=;
 b=aYkYxg/uBx8wBRypy5dyd3e/4oTUX5iMkdKe9wNzz+OrMaQEVvqDZLC6cQbKhcv4T4
 NeP4bpTJlacpK0n8vqDmqVcMqxaRp4rkLN1oWwCfh3VAI41TAC8zElEFGGGltktRxNAS
 3Gj3uyIxZfqElBKCm5Gb8Bx8cgo6CKsStT+wKPONPUnx1OnaTPOecZO/wNBeRQf+K1Jy
 OOOxcweVMlxoJXgziBYL1CEc3AAgm5kMbgOilmxpZ8GiYzWiPmzJ9fNehmAqk/G08KSj
 s3ssNfbwLPNuB6e0haMjWymGLyG3vDBPq8DwaXNrix3l93wwfsITHxbrdzF1nsYbZ96o
 cnow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFJaJzcLruTQa8Jq0nIb0aCoUb7IGmvlL51Sidfe1YjoRRe+kcCv067tpxYYqOABkpCnpOd80xWac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBD6+QvQQPQzQ6ACq67kMQCoZJpUHX/tVlyj4syiXQR2/cdBDK
 zCkVo+zGxAY9Vv7LCRzZ/2y5Sz/2UFXcXRt6hRzi7f1tsxkyIb+qEINcgh0PCmjF/+UALGeiU/W
 JrzWFs69SYsEvjRN6eHdUzPr5yNhuqlDBUuV+lr+Volsb4jKLrf1wsE1wZ7fdhkQMkd25SmA=
X-Gm-Gg: ASbGnct4DrBZvA9QA2Qlv6yiNRkb6Fhqn8m5c/keV4fn39GTnGqrnJlbaemTZLtCIDP
 w5z0D8HzqIpAvYTLRscM1Xn0lg7AOexEHBXM5zoR8kkOyo5DXigOf++H+mUDosLwAeOuk8ZJqWY
 SmJvnqrLTFJBR9S0sh/Y1DbB2UPUGFUn8/tTry/gIYutkl+tIdkpoQ9aHeoCpmNxyhiw1kkevIB
 JNHiKpaxt98CToMac1eLchJj5kW4gwUcU3icKXWwXebOAeY6gMA2YJMNpX9DZ10vGy4J4+liTBl
 eNBkHQ7b1e9BW5n2lRHRZKZogP4uieoWDd8yHa+mkS6FzWuDrqtTqq91zAftIG01aEgSv2PH3YB
 0dmuRAmWheTRSRvds3A==
X-Received: by 2002:ac8:7f09:0:b0:4a9:7fc9:d20d with SMTP id
 d75a77b69052e-4b0fc6d592dmr36978601cf.5.1755163487383; 
 Thu, 14 Aug 2025 02:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtaN7kx9dDlW8uOCvct21Xzo5DX7UKUDLDTUNq5zdRR5wx8V0EGb5Be6DEAFsefWEx3sg4Bg==
X-Received: by 2002:ac8:7f09:0:b0:4a9:7fc9:d20d with SMTP id
 d75a77b69052e-4b0fc6d592dmr36978441cf.5.1755163486865; 
 Thu, 14 Aug 2025 02:24:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e820asm2549856366b.90.2025.08.14.02.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 02:24:46 -0700 (PDT)
Message-ID: <f304f8cf-54a7-44c3-b1b6-33f5dd6763d7@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: add configuration for MSM8929
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-3-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-3-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689dab60 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=J6cW6M6AcIeHNtzA6f0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -n6eBpCeBjnXFuruCoO2f_6-tRldZMvK
X-Proofpoint-ORIG-GUID: -n6eBpCeBjnXFuruCoO2f_6-tRldZMvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX2Z3W7Rp7zNHQ
 gf/jLIBGZxP+g5Fvrl/Oh/+2LKMlfdebYASFZHBltAt+5pWIwMF1QcVJQ9b9gkJQ2CqCCLVaKQK
 l0eko3vf4DnHkpkVAofN2BdvU+yr0cA8KtmjD3+lGeRZzb/sckwJLqBG6KtYT/lJjV2N9B5bb85
 fWvzQVKcjkUWLfw/rlg7c2ptSCQ6VqJPGx6e4VO4u8/FkKbn3njfoR9inUDDqsRwMNTWleGgBwa
 EWuhrhoR1iMq7Oqn7y0Kh91TxXSs66XJOBtf7A76xlulos7nQ5m1uOaUV+BVIe29M2HeVSZtQFy
 TZu8RmWXaZgQ4+1KPhiC3fX09PpuOhjocJC3b6Qt80RbuYAzg1yNLNP6bJzIV6n6weaUxE9sLpK
 9symUGYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> MSM8929 is similar to MSM8939, it doesn't support UBWC. Provide no-UBWC
> config for the platform.
> 
> Fixes: 197713d0cf01 ("soc: qcom: ubwc: provide no-UBWC configuration")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
