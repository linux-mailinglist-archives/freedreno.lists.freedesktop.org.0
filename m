Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE6uCDhJlGn0BwIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 17 Feb 2026 11:55:52 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CCB14B096
	for <lists+freedreno@lfdr.de>; Tue, 17 Feb 2026 11:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E337610E034;
	Tue, 17 Feb 2026 10:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjpket2t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cABxVOgO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B0C10E034
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 10:55:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61GLsFT9006270
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 10:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=; b=gjpket2tJkF7Ry6c
 4Wxoow40RYWa1aGiYUPjFUiolbC8H6rqJ6xSGmY7S5fnMe6U+ZTnJOGIsre4Lxn8
 NJ/Zkz4nigFnnK1IqbRum3Org8EoX5Bc+JSHwp6ZDBEHq4udGF6ql2RZfrn6gX1i
 bjbNcshnjtxaPglb1ahI4lOIt+XidFv/rO5vdULJDlI8UfeiGDUeQTOqiSk5eT95
 3GceHAb5m4skPLqWBzmdc7yXp0H0c6+SNHNRBjEPc9uupIOQWSoRQNAwCCXKHiVo
 dS+XbCZ40Qd/pekF3d3EOjS3y1dpdk+xVfvtyWHYk0MogZ1P/TyQvEUNgVf5brjE
 wpxvgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kha78q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 10:55:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb50dfd542so229200385a.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 02:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771325747; x=1771930547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
 b=cABxVOgOW7372gfnMWfpnQL0f3RI5acJh5EZKV+7gYbjY+pyl8lZ7YX0wkM+QIYcbN
 4HHJNYtuqCSpQVmT4GbNLHni1mLPKV6R+8gT532dt5/tOOZLoYFQZU4rnSd8Yfe/XzLp
 xQJR7Kd5SH3EK2sXLoffg9oLj3aLm6dxrmChnRywlulON1j08dU5HQOhciYyykmvkjQZ
 UbjpjgMxAwLMt3tcWU6h2ON7tcO8YGM59TFReGdgbTbuevCKElvPLEhFHZzBe8DE3kTE
 h/aZ9QeW96n32FgWy5oJqsPu1IZl85uJK9JerYjX4WjtTrlYMxek4Fo5kbDC+Sa4CXTJ
 uYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771325747; x=1771930547;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
 b=i8lwaELX27bTiL+VYLSX61SP83mEgi1hz7ot595naZmgsTWX4aVPiX8Hm3VuoDOtAh
 TK9a23WqVTIPp2FGJhrkZDjF28oG/pdiUu0QHtWrVtQiizB7/bM6p1TA0tia2I8crGDr
 BBoeRJ+yP7EcjXCwlNuMrds93gHc+d2eU83q385Lyfz8uJmELRAHxhIAlTOyDruq+hsG
 rEHoNmqDD/AoYYyv0A8IauMnTuhrQhARxZYEiFLClnkQUVz8SqhZaUCpeprS0dMLPhjR
 3NzMbpTBm/dvQqFEO2hISXIx8K/2aPc+/ZSl/0ovnbMG5aZ4MhoNi6RsJuehM2ArWTqR
 xHYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuVdwsxsO93BMl4HvdL1coV9u+J02mXl7jOrb4ts7VzdUkqspMLxprzWg5A5Uj4/71/fGdjqLJEK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMDXejYbCSqsPkXk9zZmNv/PfNFd0Jq+GhGkK7kwpDICPXEbcb
 k10OF2FHffkv5ZF1W8YevHvyc1c9FRFZ9lQwB1vHwX8k5kKfYyQYehPEq9skzGedLWgTMopXi1p
 NiIAuEEorVxaLsJXprNXwJsn3tzRDBYMAPinpmDoa3RQgWAVRqbrUjHdnNzVQOzZcbfpd3jE=
X-Gm-Gg: AZuq6aJ3PrMfPn37x8LqpIEzvj0vF/yW3p6dfPxNTOQ1LaRvbga+IuztTsVUyOWalhR
 dpB3B3k9F1ZFba+kaz+RqjTW5brxsYiQpyLKDdhHUcWKUDq5tibplcOLMBtecOWUhaYfsYSWT+Z
 0J379UmpCg/AR/AOZaMHEKonv3QC8QYJ/oMFMR0T+AfVPEJBjbBv+8C1Prsf5ylb7oods0TWQhL
 pJ1/R6L8FW8jMUvcWUQtCp3JGDM9B0PdOP/+v4ov8/B0FIYYiZVx5fLigAXNf85HL3JaRj1VRzB
 8XbvNuns5vaaXhTpFnWgnn77kAv9mZUeidZOYlSG2PBaCIrYMCv6Nr5tOEkFg02CXnVnygOvDFH
 OAExN3H00LJfZeZgfQOzuguszOnG4SBWd475KD2ewn+GLpVRBkX+YEmauLfBgbmOiorUXRfZMrB
 FYs8s=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id
 af79cd13be357-8cb4084bbe4mr1324180485a.4.1771325747312; 
 Tue, 17 Feb 2026 02:55:47 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id
 af79cd13be357-8cb4084bbe4mr1324177385a.4.1771325746709; 
 Tue, 17 Feb 2026 02:55:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3f129fsm2234759a12.29.2026.02.17.02.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 02:55:45 -0800 (PST)
Message-ID: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69944934 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=gMz6hfKilskiRDmxBycA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KNbMz-ReQCYJWyu1Mo9Z2E5jJtlX5jYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfX6U31dytski3d
 A0eWmMn4+GWtKn1jmQqwn5gvS1/m8S8W0jIl9PetaGCASPEe5nQLgIQFOuoM8fciMw7n/LRlf3+
 x1Q0N3p1FpLcFQx3Ue1Pe4sjXF6tetOIixsznMKigoowmABc5ygpzX9ayS590Nbv598Q3srwzdX
 eCgXqxH+koqhM7wPM8XNDhZAKVylp9YE+Wb2X0clEkEmNby8zUQC81LOPybHXniJdP6iGZkFC24
 5gdJ7qMv6Sm/gIs2xayNLOkADn1HGkFU2qbRziYTpmG1fUFBI6ssUOvsYEj+TibUl/v+WwN3COT
 40A+b1P9vGcElNFHkDIF9nzsRuGsor8Zwmwg99pdgHtWVO5WDqLUXFlp8ZrwofwBVgDhE0DqIMq
 IGE3yPK+Dk69OWxyfqGZYQc2aHDOhbNXNorGUMxWQPAAu8NpnvndWpShz4huSuz37M3/utGP28o
 TD2pBpFU2nG4yVds9qQ==
X-Proofpoint-ORIG-GUID: KNbMz-ReQCYJWyu1Mo9Z2E5jJtlX5jYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 75CCB14B096
X-Rspamd-Action: no action

On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> 
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
> 
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
> 
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
> 
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
>  		 cfg->ubwc_dec_version == UBWC_3_0);
>  }
>  
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

Konrad
