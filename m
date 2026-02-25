Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOeOGqLTnmnwXQQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 11:49:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C434719600A
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 11:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE3210E739;
	Wed, 25 Feb 2026 10:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN6zPI5I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el+yBJLT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352CB10E739
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 10:49:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9TNkq583437
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 10:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=; b=VN6zPI5IiCr+gGGL
 53BhooNHxkG3qdCFp60f048jASDrYH6JKOc5noRharURaTiFMZgu15lGXHYlPcix
 0006N4TLPzhix+q97aRgaliH9SsMWBgU2em5V4JQrbEqbJyvyEsowx3KYmOFnMzP
 uN/7umfbkPHGI79EGLtGDCfRhdk7TPJkWDIfCVktB6WajlnAZjmDNmf14hY2X219
 XNIPk1W9pUgRM6m5W7tESwYXTUfhqaqHsP0B9IJULt7sYujt57aRK2ATIT07BD0w
 tQ9BxkE0rIckETouBI/kktzFetAQBPiv2GRaeVJc9q89OiD6KD1wPJUITekaPmdR
 6Is1AQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekjbc8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 10:49:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89547ddf32bso54805356d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772016541; x=1772621341;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=;
 b=el+yBJLT6wsas0k2Htg6GOYTFr54QHqjwvfn9J8ZR2rQIl58BqfiMXl5jHwpJoWZR2
 rKq+EJSC9Sib9orpMs3OPCDSVSMZihwf98VGlphMhlZj3zeFgmH7qGXg9UfUGrZ6pb3g
 VleGx2RbxKBJM/C6rwY5JnByLR16NvLntYC+3tr5fFMS5uhGlQgIMrAgo0pVItUWMfxP
 /h5a9LtK331F4JlXR21+0I/db26/qDlvh2zpVLcXvMlbdOqr/1AvRBNGWDZlTmORt3Mq
 0hZJ4Y6qVqwH4BP4Lj5cQbHTqQJV4lU1mq/ANbRuO+1YpNhBoRSqs5w7xYbZWC9xxxUW
 JaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016541; x=1772621341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgtx6s3ymH7QT+Ao1dj1AIr5Jv5tj5NW8LrZpgpMdSo=;
 b=YJ3Ygau/HZ+HzpzdnWXdJ9Sn00EteQJmj+TfViOQelKbajPmGhrF6nvO67ZV/UYS03
 0eKB73n2ru0e3pXUFapfLh3PZJ43QBwvsBiUpj/29bmfeVyCdDGb7vhrTnwc3yxnndhh
 nP66DYezis80k/vIkTMBTpdgnsqUrYkLLWpE5f5p4odOHFQPrmpC8TnfoYd/8Qwaf4RN
 hb7+99Lk1EvaR8ChL+D74fo1ousrx8XxKHWoHCEx7wL4HzSei7xm5Gv8sV5QFKC9hwuw
 hB5ZI9M+fmCh2irxwoq+JyG50E2vHd6eary/SXEozejH2dTAej4Xgl7RfKvrzUyMoce1
 zXjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgKmMqIEKjCbdLfo7Irjx8/Pm6pyxdGtEqG+y/i9fZAcIk4UkooeJ3vN0+Zhd6fsMwT/hiI/dobPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD0oMt26yGBAitspEKK86FwQHeC0AJeBl6GlAz+cxNtbCyBHrV
 8B7Mr7l0IkwH5LXwwM8N/nGS/2kY/TxpOpjjB/UwNL9M2XTLTtAGIL/9IUXopIddkXy838lIIRX
 Lvn9o6F0nKwDLgJFpefuuJTtnvs2QIoub35tB47ydNOiEqF5nHWDskxp1ghNA4LjOWVsLBt8=
X-Gm-Gg: ATEYQzybPUTV89nS2x2Z9fSASEVjCjtJmt4pJ6rNuwqyfUeSghtshRFdIMN0OT0OpV8
 PAM2xVu5b3+rHALuR7VZH4VDcXjkdXlAyl7+kAQvG8ggnJ6dZqigWar5t2pbB86tpx1GU0HYgE0
 KA7Kqelf3zJmA8T5vbBmbvvmYAKg+5eKWBcN/58I0fzoOAo2adC0k2Y5BkRXu1Il3girQWG+yAq
 rBQUO0JP/FnDZXdNc2L7egV4RvCSM+E7nX5CGoqwsl69WptTWWShFrYougwPL51cQ2DiAivcCnP
 3gKLYPj/MIxfp+lyjERE+O/dILth7JMOrEq+xugl0mDEJo/K936NPp1alR5o5eygyDifKO+aEek
 anTS3wuN593B3GuCUu392Odo7njGqp9r5xtiObt+ZHtqc5SDSKOO86um10tmEc5Ms7AFeBKGzS8
 GfYnM=
X-Received: by 2002:a0c:d6d1:0:b0:899:b986:9310 with SMTP id
 6a1803df08f44-899b986975fmr10482796d6.5.1772016541626; 
 Wed, 25 Feb 2026 02:49:01 -0800 (PST)
X-Received: by 2002:a0c:d6d1:0:b0:899:b986:9310 with SMTP id
 6a1803df08f44-899b986975fmr10482436d6.5.1772016541153; 
 Wed, 25 Feb 2026 02:49:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b90bdf80b04sm186150166b.3.2026.02.25.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 02:49:00 -0800 (PST)
Message-ID: <75113126-069b-4aa5-80c2-e9cfab9b032d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
To: Pengyu Luo <mitltlatltl@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-6-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225054525.6803-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699ed39e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=mSDy6qZ-4McrUV2NBLIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: tRi3vzwQgTP6pTIXZ6RDDgwkJOQNJLsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwMyBTYWx0ZWRfX9ETeFJQlU6vX
 uhwzHrxWVHiHtTcQQCgoBV/yK+GB5p5mmpbdxQUuuyY0Zd0LYY6J2gY9j1vdwa8YBeKIfhoz7iP
 lrsW6mMH8MiAZlTDMzGpskvaGxwgN6Y2vEYkO1ZNIxOkofSiI5yVf+zEUlVCx1nl2T/nQ6Z5fXS
 f+08kbJa8aPPycA9s/lgHa20R6e48sxU3HcIyvXWIMlGiYQferfceiXAD1CyJsT3qPEhUlV/zQs
 +zjEXy1+mKohS3lLHIdsmDkiJ6uUOImsyP7CE+kgFTjTHCR/3+xZPHiceioo9Qdr8OraUYfSCe8
 FbQMjAdG3TNU6V/ERLP1Doyn55ABFFOSB/hU0T7x48IWBFGAfT7yrvyMwVmWH+cM1/MLyskrFNq
 0ACH2x3hGtaNgTRcgKpHH23iniisah0NhfAU7VwpFYG+SWuyVQCTqdGiQE2WARQSrxsZ3ayGfkX
 W6dAm3D1jyUUia1zD8w==
X-Proofpoint-GUID: tRi3vzwQgTP6pTIXZ6RDDgwkJOQNJLsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250103
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.2:email]
X-Rspamd-Queue-Id: C434719600A
X-Rspamd-Action: no action

On 2/25/26 6:45 AM, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now (Partial content wrapped to
> the left side) until we submit dispcc fixes. And some panels require
> DPU timing calculation fixes too. (hdisplay / width timing round errors
> cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---

[...]

> +					port@1 {
> +						reg = <1>;
> +						mdss0_intf1_out: endpoint {

style: it's preferable to keep a new line between the last property and the
following subnode, i.e.:

port@1 {
	reg = <1>;

	mdss0_intf1_out: endpoint {
	...
}

> +							remote-endpoint = <&mdss0_dsi0_in>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +						mdss0_intf2_out: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_in>;
> +						};
> +					};
> +
>  					port@4 {
>  						reg = <4>;
>  						mdss0_intf4_out: endpoint {
> @@ -4791,6 +4806,195 @@ opp-810000000 {

[...]

> +				phy-names = "dsi";
> +
> +				phys = <&mdss0_dsi0_phy>;

property
property-names

in this order, please

[...]


> +			mdss0_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,sc8280xp-dsi-phy-5nm";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x27c>;

last entry: size=0x280, all instances, there's actually a register at +0x27c

[...]

> +				mdss0_dsi1_opp_table: opp-table {

You can reference the prior OPP table (and just call it dsi_opp_table)
since they're identical

Konrad
