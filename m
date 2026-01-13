Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51886D19DF2
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 16:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BABF10E1E7;
	Tue, 13 Jan 2026 15:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PazK/Nv/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwtOEnv/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413910E1E7
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:26:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DCW4PS3815839
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=; b=PazK/Nv/9u0YNnk3
 4f2m+A63AA6/dckoLcdhElKLR4gyvfV+TzwRMfShfoFjQ0oIlbm/TQcXNQtFh0LZ
 Ksx+/ecmR4UzdyiFD4l2N0dvX/wdoBMidautqc25z6PQCWsz+b/Jn1PGXwufDDs3
 VYmClSeuzwtmrtbwcdld0y2X+/A3rPdo2f9vxCxCJyx/SsJ3kcg1ApwL6JE++WvA
 r8ggYoxRYEJx1UG1uqoRxgNEM7JC1/XIQw47dnUgdYilLVwIikSivKgYN1JV3CB5
 wxc3tOVG/K+poy3XS4tyMrcBlddDAdpETFxRV+DT27Qb95iibWJ1Gttgg+ah5BEc
 6afLEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55sueu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:26:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso20027861cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318015; x=1768922815;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
 b=iwtOEnv/vr+s7edW3xsh2xIhy/GOksfG/Z+sAfXb15Gy9rYNC6YZyw4Y4IlClFQ+Nc
 3kXEEKxfccOKVOFAaJfkzhC0N7qJ9x5F9KSIcPzQoKjUri4JuGkgJM0GFLjM+lF6l+sz
 SKz+1Xq1yNh4bVmBZjlhkGFSI3tET/7N+xfItOrZNPDaqgotuvWp6Jnrfq2trJRojldT
 59vnUoPhpwHCFzoAzp6TwF4l551DI3gCwda8P2l+elyPpBpWsqb80w2wDGevSHHku4IE
 V8COJDzRvgPkva7l8Gmk5uxj3KInEtvPxPLBxGcUR7HehKwDtBKpER88kk3aavYPPv5S
 EEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318015; x=1768922815;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
 b=Us7t7gTaf3o8OqcE79T1Xp7rmtuMNpzqITsDhJCY2uLBzCbnh3/JQMojy4RJu1xjpM
 tTCcpx7ucOhBAKUiz3jilBOlu3XUC93vGT0Meg/HekR0bRXDG1LxWQCwvf3r6Hf2TDbt
 dj9sbz+n62qAbw2AStoS/1OWe7Nkz4FDJ3vDmO+mFpLdGknjj6ZLl51EX7gbZxLnI8hI
 EPt5Bu6qj8GXBsxxgiuQeU/PKjz9EmhlHs/PfpFXPYOL8f/IpHPT9XNrLPcuYmqzZMrv
 fxVa/QLlVDFG1rojpuDttSUZZOEEhe3+rgbhxtGE8XFQaxretGvm73K3ag8kHoNPvsVB
 4aIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPLAmqUy/To2WNhAp1b+nfqnNQEgmk74gj7CFkYTSc7KrZ9FG/1iQGAwW5YwqF9j0rcCeSU/fnMmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSUtGWP0IgINhDz+ssKjPNgYc3/hZRwo9ysSI0R058NRxizmyX
 7wntvRx0DACOenR0ICBRHv2nDEQhEs/Nl+q3d4mSHqoaxW5R9pbWaHEocTlg5L+I+vohAKCP/Jz
 GemZ6yKHK6jKJ8YP7kC6LwKX02Glx9MUq5bshshat1T0iz38qZcN6Lp0GAh7f9rYbd2RafJU=
X-Gm-Gg: AY/fxX5/jVP8Uf+e+QAe5rA/PLx2g7OwV36dHSZ9kZYc//btr2bCmvDfnVrmkzQHsOw
 p39tRATvWMrp0s+2pIpghC0bOgPwOfzxyR7Y5N6TTxpA16ceALT6wsYKQAxYfkbcp1qy8MiB7yO
 4PlgvDhOIky2gjQi69SS2pUMMXVa2ZJJjWBsW9BSyOsXBinQaxJsiPG04bRtH2Fl2laB/fJ5cZc
 QyhtiwQpEm40d7NPC8UXpVp31aOexjgyWuMZy5ERe0uGG036uWn1ReAc5CtVePg0gTyC7SdfSk3
 kg5LSvhjHuJjtiWdilflfmCwF5YNwv0fnrt6tFfdJDysT65hljtcvH7yFAb6/fWNoftPwgfG8Gp
 cUTxX12Fp/xckUnBIchVhs2zYJQEEDSCw4naTbax8/ej0kn3QvxyK3oBud9RAfy2/9+Y=
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4ffb4acf414mr226027901cf.11.1768318015261; 
 Tue, 13 Jan 2026 07:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH63OKsfsC1PCQAIfHI6h3nw+uJWv7koCZrOmWbLpsbWAxrJGkd3sfSU3Ah9H1bPnxDS8ArwA==
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4ffb4acf414mr226027601cf.11.1768318014831; 
 Tue, 13 Jan 2026 07:26:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ee5287e4sm1020534866b.52.2026.01.13.07.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:26:53 -0800 (PST)
Message-ID: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 49TvUrhx5ggGg8BL6TG_avtLoecg_VpK
X-Proofpoint-ORIG-GUID: 49TvUrhx5ggGg8BL6TG_avtLoecg_VpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX5v1AOcMzyKEt
 /CN2u0DLWIYNWdcdx7N89sFmWbN30tvkPwxJ9k2KgWmxMPMk69qNx/3LAr9wMWAc/bJreBH2kjV
 RoT2v6wYpisB/gHBsJKM9JA4gAWmgjU4+TH5FH0BjteVGdaYztxEMpMIslHVeTLwbg2o78tXIFk
 /neeUks9qpW1To/0lV4FMAquyai+S787WCNovhWqAi8wTlKbA/HnflLWYTvVzbJmvFAO4UVWP4h
 kpJY3u9uThH2fIqfCLKlArdLCqvwOOpx+16fDQhP5cu8AySLAFd75vlwN8csJJ74NePhWisoWPf
 kvFFffhpaC/huVz7PFwOALXH7ophsu0BfA7lVSaWsZQbm4b70hOC2u93NSivrQ826p/C2kpUkoQ
 dKIv2GE7V/GfsSwctLPba94+xgqbjqDENVEO8XLG4pkKEIbetGYQKgcBM/pE4O1rlbtAUnd+iDN
 I/ewNk13S0k9f6r4Baw==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69666440 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2hdBVZVomPjqdouaftMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129
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

On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
>> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
>>> MDSS and GPU drivers use different approaches to get min_acc length.
>>> Add helper function that can be used by all the drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
>>> index f052e241736c..50d891493ac8 100644
>>> --- a/include/linux/soc/qcom/ubwc.h
>>> +++ b/include/linux/soc/qcom/ubwc.h
>>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>>>  	return ret;
>>>  }
>>>  
>>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
>>> +{
>>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
>>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
>>> +		 cfg->ubwc_dec_version == UBWC_3_0);
>>
>> Are you sure this is a correct heuristic?
> 
> No, but it matches what we had in MDSS driver (and I think it matches
> the chipsets that were selected by the GPU driver).

Should we keep a comment that this is a best guess that worked out so
far?

Konrad
