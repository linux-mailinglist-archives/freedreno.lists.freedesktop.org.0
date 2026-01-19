Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A075D3A8A8
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 13:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B1210E429;
	Mon, 19 Jan 2026 12:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G568nbUz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkW3s7M4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894B910E429
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:25:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J91F9m748347
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=; b=G568nbUz3mTLaxzL
 fvKXILX8yDmVLj8GAkG5rA7IscY1QEbXGXjd1uwfjOmcL15avGUcK4nUVAaDo0ye
 WAQNUwdXnjylWQtjLotCVPuFYtuVFmMv8faSuH1YnILIhSGUmdzU1DI4PK+bxtm0
 Cz/Ioqya8TnrEMgbmHu1pK4L1S1C0mxC8YmjZVNl6uTyzkjO6k/Lc2OEAT72bwIo
 fDJBbkJv1pRIqJfxVDTQYM9Qxi0VD4SwaU/pdvxbEvMBIBNw0ys0BmMKSxFbdwVU
 7Nwek3Cc74F3hxYMBF71nlq4pIRHxMYHefPnnnd3gth3yZk94miW0FUAZCbJIJTV
 HjFJrg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t750m2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:25:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88fd7ddba3fso19233306d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825502; x=1769430302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=;
 b=RkW3s7M4TjlBCpTCgS55xggtrcDC5LkLMjWRAUCdE9Dlq/cg9cRQSvQmr+34LeYwMd
 nI2yNSSz0qAszghBXVhyZfrQEbGKUb1J8jVJ/zk6kIEcDR7qtMrHpoQQI/zusqLlpZO4
 EUs0cP7c2YlJ/mYhOK9TU6nEP2qXWVK/D0RTk+arcfpqhYIPDiwYHfjNW/Ia4cq+WcYv
 elXHK+ZUt2OpDY4NYAO76mmkw1fUn2bOURCf7mDR011WUTcTxb+ouDsuUW+dx7dwogWl
 kAubvzhiSWwZTWPn90xY4DFEYUig/NwDnE1rJE1OaTssYeySg24ELsL8pZ1o9cIgVdpf
 3Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825502; x=1769430302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=;
 b=mdtewJvZFyforfVmWsopKSBuO/uAVvKvhvHse5QwvprL7nKmDb8q18XNsVC7PPiqTh
 IoiHCpJJHnVjZoGs4IdpqRXG15JYCw0E/zUDr7g4MA761MEhvD9dbNir3/TROdYYzM4W
 tj7qLK24MrAxcNVtqQk89Gx9iY8Z+xb879EkW+EJg3mi+2iO0xFzvgFwP9chxmHnyiK4
 29SXeSfngHMuBq4rrAjYMgBzVeT8lYODUYsPoc87r49+zuTcGRycRcd0CRFKk9s2L3by
 wHz/ynrnrPWUlpXdnSpFQHuWMzqiarcvqHY0teqW4qZExzQl/f/zH298n0Ni2FadaR3A
 bgqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpfPjGFlpbzB55V0bRkoD01Pt6AgqJnJAkChjaS7RkZtFnTGGqUoKdqqSfTDMmfuMvLn3uz9o76qA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKOPI/YdH4cjwwwxpn9/K1zvyHKQnwxfeIFjDbIQzAuCB8pEWH
 cRcls7dFyPb/0YyYIa5laCLKdfPifBj0nSJfUkIpm7KXH25cCa5MQDlF4v8nZhg5B2RGKYxBiur
 C8frLU53Zeun0Z8RuYwLbMDYafPmd69QFZ1shb2Wne1wF4qaidOPMde/5ZvSrwKPGjVhiMUY=
X-Gm-Gg: AY/fxX65VmqMQo2lKGjJ2r/PCXO6284hCfTY2luDqyHMUIwnkfy6/t2+Zi4wvHrhoqm
 KeDOV2koGrcTj+edzy7CnzCXa23U25M/pl/qEsQAfJgVjYfcq4S7KFFJa8BGWkV59x8DXNYq2pW
 nWaZooRg4Cfg8AnrCbgol7oOHxdN0EbsB68KcWUT9jGBPa/+ptQaoQJVQXKUn+dYJN42/sveBxZ
 dy9cfZ/IMyVqV76Hb5yv1Uhs3QG1ZVRp0L2+FGh8LpqpDPFVn3yiZTHHO512u9XIImChus2PaOS
 fkGm0sWsVNCUwET2nZwoKStAxRSfzsaPgmeXoHWv/+iaNktWPVGW3yY1GhYjUe/x87CiVE6/ja6
 90Yg6HhSEdEFg0eCsic1ezlUm965Y4hZ6/UBbYH28k4G+ILldSFTLTK5JHdJ2sqOXZeM=
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id
 af79cd13be357-8c6a67cb0bbmr1154158985a.10.1768825501856; 
 Mon, 19 Jan 2026 04:25:01 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id
 af79cd13be357-8c6a67cb0bbmr1154156385a.10.1768825501296; 
 Mon, 19 Jan 2026 04:25:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c9fbbsm1114310366b.38.2026.01.19.04.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 04:25:00 -0800 (PST)
Message-ID: <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 13:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
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
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e229e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s51bjNJNeX3feSWTtREA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: dKqsiduN0t-mRJHeb0O2j9GafFWq3-JZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX7Z1NsoBt8u8A
 CQ1wssB4tlagHkkgSMT1wF92b1rEO+y4sb+iVyD7e79lXdqWk770ayWGIpOY6FJFDQIUK34cetr
 Lt3UtD38WJs9wRq9E6S0ZX7AzDrgt4YOwsp0ksGsCnt/3nQD50aoMCP40UHEOJ/Hva0aogYNi5w
 QJTXOp6mLHMiVqMvKloHXB6PayyRQq0Cp6IC8vzgUIuAjHDF3mh/y9T5GOLU2ONwur4IdLiONSo
 EJ3EnEuZnogzN6E9Ai6O2cjkNca8/CPjsmCUYrtD50/hO/UVYfFAbQ/xrlrxkbXiyJPxN1eyCNo
 PlCYz/DQKeleWOx7D9HA8rDyX+CYxeHAgV08nOeM1h98gK68TePzw1wswI+s27HUJuJ0j30L4LC
 k+uOnSS6/4wGSGp3eqMiu4sZm8A0p9Qjz0A+4aqohugLZnkemnGEzn3unatdYTv6rytJUFM6qSe
 JQaW9RkL2j9QdVWo90g==
X-Proofpoint-GUID: dKqsiduN0t-mRJHeb0O2j9GafFWq3-JZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

On 1/19/26 1:16 PM, Dmitry Baryshkov wrote:
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
> 
> Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> -					BIT(8) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_2_0:
> +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				BIT(8) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_3_0:
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_4_0:
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> -			break;
> +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);

This is pre-existing, but BIT(30) is not unconditional in SDE for v3

For this patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

