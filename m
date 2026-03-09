Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIZ0FAPBrmmKIgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:45:55 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFBD239194
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9104A10E181;
	Mon,  9 Mar 2026 12:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJxHGez8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnTNc+sT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BD210E181
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 12:45:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629AjhDf1968932
 for <freedreno@lists.freedesktop.org>; Mon, 9 Mar 2026 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7htRU030UkbwgiiMTsv8tqmBCQS1hKqLxCtSkMtmYYg=; b=RJxHGez8Ty/0vQ0Y
 pPBlFcR5683mwROj6D7MZPXjDseTZNdeIF2XGSdC8FHj2m1sAf9wZnLrXagAKH5b
 0XUrYIkb/SZGlHch7y/pLrH1behCPEWkzTZ8+AAzrEsEyqyYkCqvkkGVM8wbfEUL
 L9uEvWl1mQuIS2NmTc9ADwjv/VARGhpwpS1KQA6jJyEJduydlEc+ZQ7bXy4kM9Ng
 tVybUB0gv2A/aqrIbLzrPU5PkuNS219FPqRZyujRtFtLZmxm1jF8U73PYCaRxYkh
 gt5eneHPilAb7/s1TYM9Zy84wv+aGZ6tznYwIBzrFgNvmYwp8J5Zx6QXE62GxdiV
 9zDl9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrnj0f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 12:45:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb50dfd542so796607285a.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773060352; x=1773665152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7htRU030UkbwgiiMTsv8tqmBCQS1hKqLxCtSkMtmYYg=;
 b=MnTNc+sT4FrDsrxKpCOtOZk6q/DBTHvIgNDB9x5oVHszoGKRk0VsUn4d4FgMWxASqH
 FbcwOt6RGP54n6Il7VCNJRWZhJMb5Jh63us3fdn1pDvfc7A8Fo9V6tWKLO0xtp29V5fN
 mPRxAi89fr80aYg8JQunZVpdG2g2XasSD1X6V3m5CdRBOQSWINV9EvQgkk75SxanoKhO
 wxTNlySQCB7+b/vm+eVS0RxqK32hfaseQYIrF58ZAyT1bs8oC06XzDvNFF1DLh4gUmyK
 Y1adr7ninz6WyIMaK070ofEsrAkDtJxXPZeh9PEyskjE2j9bHA8gmHOp78Plrrk9XlwH
 uedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060352; x=1773665152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7htRU030UkbwgiiMTsv8tqmBCQS1hKqLxCtSkMtmYYg=;
 b=s/9/o98KfD6ENPpufwDYtAIVU33kpotBadlNSX0KuHBc66tS585OYUZ2QvwIxFtzbO
 lIXI5U6BFEInTCFAoNjPUmW3hnj4nxlZD1jYiGlAKhuKv/0DReXLAMFJYsVoKtJaLCUY
 eFuqmy4cV500v1ZW56niINPyebmZMEG7WVe82dMwMC6IdIyWoUxYswu6FngfbdgkzOtn
 DbR/9/gUav/fKEcCD9eoB+guTSld+o6z8Rpjm82z3cIHhrGk8osK0QNDF9l2aKhr4AwU
 QyuoSV7xtTmGvT9qkuJ5gAouAdjAnqr6qKQYr/pS/jRR3B1y8OhoKqKfT5OB1LkxBMMG
 Mzhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0RLUdZwEG7a43pVrqw3GdKJIQ1oZwggNkihC/tCXmEsVRLD6TYsHVX6/c299xiP43OWafzon4scA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxoNHrUVBMzqJWmanHShOdSfNFXoO1s1EEGhq6HfVCAmIggPzk
 DHUF8URZmJkUTjmY1ZNpz2CG0uwLgphRiM2okrqpRotlSlybnLduGawfU/EnxMSgZ0Q2O5oMu0s
 DXPKJ5eE8MOC25a35DhRGHsosyMXIwafgNAnnss4lgOwLmiYFW1abip1ofe25i3NW8In+mPk=
X-Gm-Gg: ATEYQzwtq0CZyYl7taGp9iaKhW+aGHsmXrrGsQ8aVlqX1CBmBi+5tNZyamOkMkgx1Ek
 10oATS6ErjlkKmNmo0F6MQwwhuY+lxG6wmnOUJQ8umCruIWQ/DhstaAMMlOskIKRTPSYjtBOvje
 sRRDBVvAZopwbmt/CdrhvT0wfoB8u40wr1MfU9kjt3gchYpJ4VcCtGE19HyVOI6dfqfz0DjHF23
 4nr6yWG/IfjQfcWDmcVTnDapJJgKze41fsvXLMZfOu9l1LhK+tV/ovWiKv9cEX+yJ3MDWWTTR2B
 Ldb+igPVmk2M5drasBuD3jGsYnmd4ibGXB1n9+lWJ/2qrjLMFu0Gq5C+g7reqIIppRAVhVpJjt8
 QyHEsFnvCy1Dr9+inMjqU8oSnl+09/vX6k9Uqh+bD7Nm/Zj60w65EP9OIKCPIQvpxfQzbs8THbT
 CAZAg=
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id
 af79cd13be357-8cd8bfb0eb3mr161911385a.0.1773060351940; 
 Mon, 09 Mar 2026 05:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id
 af79cd13be357-8cd8bfb0eb3mr161908385a.0.1773060351520; 
 Mon, 09 Mar 2026 05:45:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a55a660csm3141140a12.33.2026.03.09.05.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:45:50 -0700 (PDT)
Message-ID: <48c9e2ab-ab0a-4148-83d7-9aeb3de274cf@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/msm/dp: fix HPD state status bit shift value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-1-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-1-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aec100 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5rTfuJP6cXs4uNvNC2oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: d7vxNF5Mc-jaVnJT-31OAjYBfKd9q2Ri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX+pV3OYXRB6j5
 3DUd+ykcb2XXvpxpx8dZCexoF3N2i3uFuuiTawB0O6AdqcjrnbONrX94uhgfW+XAPnhFEUnuL3n
 ttRuL+IOUFyxc9O2J+IOm2y602H1WMRIeaGQqrH6O+G60gSw/oe928YqfA6jFNWlLis5GacSklJ
 l/GRlH70ngF2bJpYzMdfxTukBHN+DkmAHxcdSaFLoFPDKVffQuDk99BkM9kCYFf3tspiOKPg5s/
 KV/3aLN8Fln0bEIwLjXYxE9zYCIZrMdG3R8mKLNxNDs32G/RB3iHfVcqKm7/m263MnLgUAP5+rt
 ONi1tc6CphnkXCuAbCSHSdBCGrN1a39qFZRD65VD6YXiadjYTc16jWmhsSwsIsHs7XmuB13Eu7M
 osMQImRktD92nl0CUUhuTqGgC8pdbvVX2X+VOzQPW4xE+M+yeVZmM67GJRBM1dZpWU2ykq+tLlD
 D05QDf76ESIUP4pvxIQ==
X-Proofpoint-GUID: d7vxNF5Mc-jaVnJT-31OAjYBfKd9q2Ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
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
X-Rspamd-Queue-Id: BCFBD239194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
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
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The HPD state status is the 3 most significant bits, not 4 bits of the
> HPD_INT_STATUS register.
> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
