Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK9tNi41qGm+pQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 14:35:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54556200809
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 14:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E7E10E189;
	Wed,  4 Mar 2026 13:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJsYsb/2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCPThvbh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D610E9F5
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 13:35:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624Buv5x2306436
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 13:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=; b=VJsYsb/2vSUGtnPX
 iAmIkOgQTRoD/pXdcxv1p9Ch0KCg8y24kjy3jAWP4wTumPB6ms0CkgQw/LwXj4ft
 jP5S7gacgbggk+5rn5iq5pzem1VogAAJ4ZV6zmZ5+gpii9RmVKti/zw6QSyShX3y
 XHUCT9i7mQKRxa7HMw2lvXY1bUYLjYVqTpsDua7MZbX9AAaV/tbsPOYIlxXFbCM2
 gsWcrtBwC/BRN9c/dDXdPZHguTytvXTGXHySYLjjGWCtO2VwqlPEZ5k5hQPO3QG6
 bQk4G3Mxuyr7yhbli8QeIIutffjrcG3TXMi87c2vzO1hS/4vkK/RJwSFiam8i/Rp
 pF3uSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8t9fd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 13:35:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb50dfd542so530476685a.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772631338; x=1773236138;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=;
 b=FCPThvbhh5IGHVxAaWiTtR9x8+gEIjALVTrwAP5oZNmQA7/oGgtN+IIrog9CRWCExh
 W3a5xxKkJG1Ng4eiXWmsMoWPWgyeEP6fE9VLdUWRIqzzuPmXRjyYBWALDS7tHohOA2u+
 atGRDgDgcqSLoRPEM8NHab9wU0sBnQfaLmdakoPURZvhJcmIPyRHCHHlqEhDAQJhJ/kr
 69674f8buZxShsWe5GA7vAZ7Wt8LC3HrhBUIwnUq/rL6Z68OTqabSBMpPYYlz/L+sY6k
 0pfHBw9gHy8S7lA0vxYwUFpyIPLmjZl/Wsd4bC6tpkwmHpU3xIHuamP3pg9wGyCWvhBM
 +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772631338; x=1773236138;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=;
 b=LF6TLgLr02ifxsr4oGu8bdL6uBIWNXMgfFWxUIXyZNEdsTIA9s6LBu5L09lHfS1GjM
 AsgEbJmc0B0ZmC15bzqWwQmtzbqI1xcF215jbr6F/z4NAHkNcfulu04vcNx7pjmb887M
 GE6k5NCdoVyxT6gw1NSWAGbsWP3lInd1hk5aSEi79h0iRUqdok6C6WNZgUnA9r0VNjUA
 dX0Iq9AhhH1aMSlbKaspZ7Tl36vQVDDZxh2jnb8Qqp5PWn6avzoAb+5OwJ5AixHt605W
 MV/psFBk2LrKhyxz0x1VIPy5m0QaYZab93qZ5bI67cr+9UgUZdZWgf7kqeu2cx1IiI1h
 3mFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+fn4SmHyWtrPKq9zJBId6jZojFQDd51VSixQZZPBZQlfAe2pYgrs9DirpuvAiV5uyAngoTyQ2FFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiLcgG1COtnvcnu0GBxs4e07JepDiKbA1sM8jpDoM23YYj0lg6
 gGYYPpMSXB8pvjOO5e+QSCrkuGG7+x+Q3B+vIzZIuZ9fQU223xoVejpQRwdZfE3suAXRfYcMV+2
 hGTUtC4WNX22PJH4tsjgDKujzbENgHlczxDM1xVJGpAbtdl7J4K+68LaMGTdo8Lis49NXgoA=
X-Gm-Gg: ATEYQzzMjDRelBRMLmrqeqJHQkdSgMRQQtpq+QtsUqQVznRigNVFpX1zF/0CS4zzIrw
 0zDa8tnO+Oy3uSux+doCk4ZKZZZO9WoX1FYDJsmvMcnXw9BgvfaF6RTkdP57O8BNYbuOtS03XWO
 EDbe7S2oRCj5Xx5RdTw1v6nmKeDidcLo2weCMIgKYwwAYGbIgaXREuVsiUo7mmYL2VKeSWHkfG8
 pvFck/ju7Mg/S7oZ+kD++4DEVBVxpyb8yCtkaa4lpo+H7MWkP2kKW9EiulHA9dG/S35bJlbrLJW
 aZggEgATcFux+ILyqjGEfHpv+My5qkT7eQuD136CiW1XCZWcWbwjwkRrpUlzP08/OvzRrP0rqDK
 ihsrA+6r9nQL2Vaqe/sbLizcGyghqk4f+z63AX2lxyIccjmNatL9NuThVlOw1r5HXauBpibCagV
 6KGps=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr175281385a.9.1772631337973; 
 Wed, 04 Mar 2026 05:35:37 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr175276685a.9.1772631337417; 
 Wed, 04 Mar 2026 05:35:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-660b5df4bf9sm1505895a12.29.2026.03.04.05.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 05:35:36 -0800 (PST)
Message-ID: <7e092c9d-ccc9-4084-91a8-7ddb063a904d@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 14:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a8352b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ofcykXZfb13_7XvavCoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yAszAe9UzIIl-zHhmcUUcBApzLZlZs5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwOSBTYWx0ZWRfXwm4QUwwGD1Tx
 BhlvT4iuxEP1vxmaGzwGT74GGK9kzilY/vT3/4MKVjPFfcO8idqZkmqlk/DUSoiXq7hyrMYvlYy
 DFAtvCBFW8GFLU+kDPfN+QCqmxqO4PmGzbutyWPJonsd4tgLHnjVCuvKWRNYwxaQgtpd+sSUQWI
 CSZS6xoOY4c9O9siy7jh6C5GBXhddos3kBszHdfcVoVTquv9FAIZq1tf4f4LSCYH49V8eVXpO0O
 BEo3f+hkrazWYna1IuLRND4pGxOqbjRqm56QSPeSSvms/olwnDyj2FHJBERFAWBRJxvjkUCDUjE
 0zMIOCUu+QP4xg4vqG/A28EUJtkavL4+yA1rAGFCMk6S9tz2/2WkbiIDHzaisqN+bURxwopzlE9
 43+DcF8of6C8Uc0BCaSZPPDV5IGhfWSwYqkenwWYh8HXU+iZ4TP3FrnhD6KBzKDA0lRDvZAFAsO
 dqpQjWIH/QlJicVS3Pg==
X-Proofpoint-GUID: yAszAe9UzIIl-zHhmcUUcBApzLZlZs5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040109
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
X-Rspamd-Queue-Id: 54556200809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 1:58 PM, Krzysztof Kozlowski wrote:
> Add configuration data and an entry to OF table for matching the Eliza
> SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
>    highest bank bits).
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..633d1efa0883 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
>  	/* no UBWC, no HBB */
>  };
>  
> +static const struct qcom_ubwc_cfg_data eliza_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = 6,

 = UBWC_SWIZZLE_ENABLE_LVL2 | UBWC_SWIZZLE_ENABLE_LVL3

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
