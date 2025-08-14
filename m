Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2CBB260B6
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5210E078;
	Thu, 14 Aug 2025 09:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVki3B+K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D937110E078
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:23:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN2rlC031245
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rr8nJMfQPfH5v6BDXEA9yngasaki1qlI6+ZUchKQ1BU=; b=XVki3B+KzUIq1NxD
 +a3auLWmpQJUUl88yWV9KbFruKeA16xcU2n9N73EeExsQr2iz7EoVYBZuuLA0KhP
 JI3RujXwl58kln+zzuBB9PtU3AHLxNOcMTTp1wD0iim/iQmpS9t+xWxt79F4M/Lb
 9S0vR4yWwuqS52/9FkxBsEBGEZdsWiNdbtrSnRFQzwBEdpITlkEXaS58niLu6P13
 K5N+k6BPK/4QHwHDLONHUU5VLaEcgEo3bFlYBq3Bt3idxIKnIi943E6YMgxog5I8
 aldTwaVcXPLBeuo/ykJQsJltZYbBBzZk07dJgZHgXsg4VXzxlVDuyxHbjoo4eBcU
 zAC+qg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vt1cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:23:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109bd9b3dso2455161cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163430; x=1755768230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rr8nJMfQPfH5v6BDXEA9yngasaki1qlI6+ZUchKQ1BU=;
 b=AEDW87cUexdVbvarcyuY1M6cDCgKjXDIdFtnrx8i+cKIi8Wip6OAL8tXz4P+XIQPIf
 54NTNfPc2BsO0e1Tem7+bf/2DMeRTjKWUn9h16cau4WKJ7aKaOWCdDRJElqzUHjX8c7m
 R4xPvlsaC7R/ab33jt1T+ltMcaqkwNS4oe0hdfngMkelyTUBTSGSGRLqrU+KauXS2h8o
 IRin9hUbIDBx2PBcVDynb65idmH0/IBKRlh6HqvmV6zcSa1NxzCpqz4fZlA6hJXsZuEv
 UH35AcGL9dVod29ZEBUYZbRvLnF9xlhrKcrpkh/DF9eb7FxcSrgFj02qDWk1gX8hCka4
 0FXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCRo49XIhrX6SIa5BfspyqhXwMnVJAAz0aZEoHyq+fZThWsPrZt3+8BMFihK6S65tJ5iUn+YveAS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLRZpr39kFElL2nrzSnYl0yCWKuwWvc4KdoYqPI7UoU30fmLI/
 VYR9ddbg6fMHU3gxKh1tK/rE9N8oZe0AnYDvuXI0NGklvxEtrhCvJEUbR4rBCJ7SpxB9H1op6wy
 1LAw3IC6s4YGmAIK/CuI/6HSu4Em5lak60ljCXG/YlrrexSvP4H9zDPKq/cN6ZcJ9PzjFYR0=
X-Gm-Gg: ASbGncskjfaZ3PHEWZj4OnpCIqNjhVJaCP/JiOrn6yiSCVdg8BkJauR5UjWdeFB5ffi
 WnBdWbFRC3uRrKCtuSPaKq5iPEfTMfEJyuqvObLLpr+ml+9LXrEAQ5Rrsdo18FBoKeQdeBsxOxm
 +nq73FyS09Q1t7fzgoompXec0TiGiRcogfC/ZHsXmj4Rc9TTQyzN/IVnbtfyojiQXqdGeD7VZR3
 rDXrfOeM2xHpKqUdj0BzpYnF7BydzLkMG1yf30QealhwXhtLLc7h+lYOWW6+MNns/82KGoVQGhQ
 tlbpoCu3y26ACuNMEpVzYaEsDwgc/kxsFiH1L00zUmelUWqvyqeelXReyreGrSNjPnf2TCqcpG9
 0kTr9kBBj+h1N3HrFaA==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id
 d75a77b69052e-4b10ab40660mr16148741cf.11.1755163430090; 
 Thu, 14 Aug 2025 02:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEmqdtGcjWlowhifxBpEnAQnNU5How2ZYW9ypeoFFwgzTxDN1AK/KzEpZK/3H7HMSaNxTjIQ==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id
 d75a77b69052e-4b10ab40660mr16148641cf.11.1755163429567; 
 Thu, 14 Aug 2025 02:23:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a07670bsm2574670766b.8.2025.08.14.02.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 02:23:49 -0700 (PDT)
Message-ID: <5fd77c1c-ffb3-4413-929a-36437b170591@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: ubwc: use no-uwbc config for MSM8917
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-1-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-1-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX4GA3Y55Jnh8v
 ca2+A+CK1L9/SvLIQvDGTkinOF8EG2h14yyXvjdGk3yjQlpT5/UWFI/+OvmF8eZKsOTFw9Ze6P6
 EUNnCpe1Kz5KLU0GpM5UWsWEAXu10CQz6nCZ6pLXQJXPZ8C+4nQQtnXknoBYYGlCLezXX9pvxsQ
 cCgJbTqpvAC9iBdTOFKtuORoAhaGtWD+sVuQ8WEfaou+gU+24XHgGTTnQSaAMWBMpUKnDwIWrrq
 A1tw6ji/oDr7/9MS/cHo0J1clccFbIPyEv/Sx7Ynzphwh4j+g01suAVhUHsJS41/nfYSCMGbXld
 Z3NJiHDNtFMsPHba/YZ7jKoLJMNMbwOS4MOn0LKcI2UoTxGx3JIq0zz0asUK14Q0ohKLbS4XZxU
 ggvGvKJe
X-Proofpoint-GUID: w0G7IW7R_qm-mFFqibMVHpr-bQcFi5ip
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689dab27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8
 a=GOBAdVRHtaGIiaGvnzsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: w0G7IW7R_qm-mFFqibMVHpr-bQcFi5ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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
> MSM8917 has MDSS 1.15 and Adreno 308, neither of which support UBWC.
> Change UBWC configuration to point out that UBWC is not supported on
> this platform.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..5113c2902bf2ba3711bb14b35bbbb8a2b49b8cfe 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -225,7 +225,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
>  	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> -	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-mdss.dtsi#93

&mdss_rotator {
	/delete-property/ qcom,mdss-has-ubwc;
};

argh! thanks for catching that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
