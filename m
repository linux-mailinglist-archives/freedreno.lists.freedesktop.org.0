Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2924D3A603
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 11:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350C10E3F7;
	Mon, 19 Jan 2026 10:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocbvuMh8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UI+oKton";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3907A10E3F5
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 10:57:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J91Df11150083
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=; b=ocbvuMh89UuSLKWV
 3fKD4orKNFo2fAlosJkH6YQOzLzidy2Ii9h0wFG5HT/sva+fsDNJ9hdZhyXlxbsu
 sYtfgmTT0npk/GREExUf6nsbM9/LzGFP+YVW8+Q+1XFYau2oRjbrgG8wkDIpuYW7
 5eQJ9c3n7hEFaHRDtPddoAXjLBAK8IwSpnbkn3vQxh2VJ/Z2MRVSwEHu9R6o5Rb6
 mHWsEvoUCtp7JtlEZ5ibqqb1qM8EJ2rh9ZROJthZqt+uuGekiJOGQGuN8MgbA80B
 qpg/fqJlZ3bhygUzz5T+zOn7POqc6HSka0qkx1/v+3MdfWERlxvp7nhYij39CMjT
 gAs77A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e562b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 10:57:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a39073c8bso16101806d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768820266; x=1769425066;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=;
 b=UI+oKtoniHR6VtKqOGPfH9TdbA2PtrfVMslSaoon7bhmG10AUExx7jgISw24eHTwQj
 i9wvVPIIMFnyb5PExa8BbHXcDe5J6jDgU+3XLePpNbrsnWT5jIS9X02GHQF+gOSq9t5b
 YBFh25UvbdAkRoCgETOjJbr8vcaLxUcRMBVFiu4Swe16tvkZ4jheR8UeKR9SzaND9bgJ
 E+JFoTJX6FrK3qmlVVyGeShppTwL3C9wDpIm1o5tcoZhrbNT62wWjmluwtxlxd3pXTaH
 B4KTHxZd2xj4Ygj0Lv/ngKz6uicN5JB732ouxgt56WwZalqm2hC1bFPchWK3Z9Jl5/gH
 d9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768820266; x=1769425066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=;
 b=tD1fuKeLLp5PFC3r7znRVAEGrYV1Thzmm7NIdvNWRc8ZN3HyzWluNdx3ME6TdbcxnS
 /S2kafJDw8v5zWCXUDIfrwgOVaqGIKUrXyfgIpu6HB2oWMIy5qYzpNncpdhmsuBgkJTD
 jpmb5nsIr0H/sLIKx8xjsyoehDV4ydPcBdjpWof3yoio6rB0MKpPoLmrd86mv7uGfUog
 sYER1vGkuA7v11eSwQBKpvZIyl5P//sSE2jZonnyON3RLT8BA/XEasuKxnp7t7igPYO/
 ZZFHhqORaEDWZz/tf1gl7GSqwHkg+Kwrv1WvROiHLDVVfVWRgpinXC5achSH0e9sDVMD
 Th0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1KHJlU6hpTFwcmXNmvem7AIfdkhCfYWXSx7vhC9ROwFEE1LqN1Z/mmZ75b1rqLtOIaOActvMfsJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw89lM2VFwaR5CKr/k8qBGhIcaYJUwM8Mpay2sHsS1vDk8Twy3E
 curky/0dWWfqpsCSg3DWjTYnr1SHe3vzSHQh56eC05QhalpBrjI3lPz8SyPc5ErhKi9xloyA5NY
 sb+fJTtldIOK/i5PThl7T8SEDlM0l+iCCvzPaQbTbpVmHTN/oos7iB1ZbsHCyKHAQk9QP/z8=
X-Gm-Gg: AY/fxX6c26W3razXEQ7fQ0fqovIx0h6XP9tC8IhHB5U/tKFUY++rWk+VVPL/7nrc6Ga
 Fxwsza1H0ipuL+Zn0atxgF1yRWdYJy30issaEkESHXm7oEo4l/PzgZJLOzSUcPUdSb43XBFOPkK
 qWQKh/uvNUrZvFQHQ4LnvH4IHrEZO0S3iAZT1qCUNDQiBAG8E7l17+JCfbibyA5TEq2jxpd8931
 o7dVW6jTVRFz2T3Ysb8/qbuhA4tAhMdQjL9dmFLDodC4+MfJSZ76wVU9mzUYfxKVapyxAY7zyYp
 mqT8QAFvWCK7JA5Fe87BqAHh6zvDWURPdOTpeLldcHnsAeigwqdyULEEsDKO+/2p5FnVDXJKP/q
 //CeClHCbfRJtzG8QhTP1x3VtV5Webrrt5irrGkKEPO6oYx0cVwC2qJNRPnBP+GFvyKk=
X-Received: by 2002:a05:620a:288c:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c6a6705accmr1215768685a.3.1768820265753; 
 Mon, 19 Jan 2026 02:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:288c:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c6a6705accmr1215765885a.3.1768820265337; 
 Mon, 19 Jan 2026 02:57:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e8d1sm1102898466b.2.2026.01.19.02.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 02:57:44 -0800 (PST)
Message-ID: <16e02476-0c26-4ca4-8080-c494a89e58a1@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0e2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=X1d9jF6ZyTQ8TVP8WxQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MCBTYWx0ZWRfXwJcO3Up3atw2
 mYVAe/vCTJU/Oa9+YhjboTIGfSCdlGCh6PImil+mk6MM4iLbK+jieEQe/vjt2lUt2Ulfm9o2n7V
 tvYOD3XE3LMnFDKGIu+4uJx4kJJ3UF0QCgIbIUvr19ldNjRkpu0hzLzj+1+ObwF2Gzxi4tZ+/nY
 wLd2a39RxazXyaGRrQXaZ/y3phUZQYn5jYMAAwBjr4o6WqIrMhgV71XuqKk+Akned/0OAKDl61s
 /Aracs70sgEJG2nE3CuTd1OU3YCLQpoYCOFdWutKQAqMw5DBubYU8hnwjaa7V+stPKyqK88dmg6
 No0fqFrvW1m+P1bXHz8izVlB90f1ruzNbP94tfNDWx9omoQLJQU+fEFX/gCLZ0QqrUYYnOzL67w
 XXxKKQXqKjn3z2QpGQ3hsZ+FqqXAD4RiNE4CDooBtKoz+NoeSmEhrBlPsWrEdpa16ZlPE8VjUuY
 kw0nMkQab2qqicSm4zQ==
X-Proofpoint-GUID: XMW6WAIX1XyPUcvHPHm8Ad4X_JWh0w3X
X-Proofpoint-ORIG-GUID: XMW6WAIX1XyPUcvHPHm8Ad4X_JWh0w3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190090
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

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> Since DPU 8.0 there is a separate register for the second rectangle,
> which needs to be programmed with the UBWC config if multirect is being
> used. Write pipe's UBWC configuration to the correct register.
> 
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

