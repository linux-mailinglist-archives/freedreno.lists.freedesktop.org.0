Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1+m7J0U5rGnAnAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:13 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4235122C34B
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF7B10E35B;
	Sat,  7 Mar 2026 14:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEnu/OnA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REG7AcGa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106B10ED75
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 15:49:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FVpsQ537227
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 15:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=; b=cEnu/OnAC1cBRLNl
 4oQ9YSwsZrvBAX9vdKjIs9IzdOxhYHFFQ0EAkTpagLjsb1DfxR5yMosUQ3mz5pDo
 S0lStsQEKOV0jFVu6gcYfnTboyaow+s2cJOaGYaQfpvaYF+RmDLZPh/Ec3Q4HHzL
 Z4ms2RHS4O9mHg1ZDJsSdiKGKAVEjPMiGp0rVjpjmHAvTmzI7XmKLHrZcEGy0R4O
 1Pn0H6H086qujpi/XmdmZdKzDTWEaQZJn0ctv0+8fOqWxpWuTHXaPT4sSIpbZi5c
 jEt096fLWsPp3uPV3vFuKCWSlMp0pyiUXcI3mQVepsO1b163WXom9joVA8/cXTl/
 cA1vHw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtc72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 15:49:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1275c6fc58aso17579834c88.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772812151; x=1773416951;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
 b=REG7AcGaV6CmGFvvU+7fUTxsAv+VTXIR57QPzK+L4M1//vCgqsvNpVq50l3grZ1A4G
 zHgbqVUAiKjwSkHCKnTPTSRJbrtZC5lz4WptZ9JJuAE5VBODSbRIO2Wqwalg/+0WRFfe
 nG/xXCeMU4as9V3NjVYQsAoZjv18VArqTf1wiBBOzmlzsC6TlRqM32DUSl28SF7kKVSr
 6gQgmux0vdVr1teE5FVa0sezTz+tMEOK4JH7wfkQ37xKMNthd6962zP6Qbx2SYbZYc/V
 7Ebb6uTQR4NaZjdYV8X27V20gll6tDs7Kc1zL9dy09Tuau3iv6lHIwK6STwR8ih1sORK
 GW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812151; x=1773416951;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
 b=qq0zmDG2qEPa9aHqvC5UvxXqLcZ2azrqm6I3qESom4rDdrLS+iG9S/2Pvx0cjlWH4j
 QG/WbSaDwEz7jwsmR69yDvSVCjnRhsC+G3iHtpvUwqMYcesL24UUGn5GYL87yemrJFvS
 AxoVs5xQdqJf/KJfX6+YBN8eFnM6nJd40upiic2uGkF6inKLqgG/2bxZvQa73t6ckc+u
 1vbsUAHvgSdf8Ix4VLYHd7JCZvc+0oINQA955yncOJjcAS4tHpUYD59ZCZf2N0MY80CH
 Xd24pvh//+HcLkq9zOAa1HuimvsC/a4Hml7jlidGlrVNZzpw/RIa5ek20tzjQchBP8uT
 eLnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2gzXKgyWaGHdOrqzWFcQ+y/BjM+ETduAhSKyjo0X7GC8FPeLrXTTdUtn7yx1OdRm2+AK5yhtLtmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgDNS82+LBKyP1oFRlHXZZQLMqDqLsX+WHTdmoboc7OF9qHz5P
 MDienmIiduGg4qeICAxzdiEInkMg7kvPIIh6uGSb3AnEwHbGHLP6fx1BM5nXHoSaheRIdABw64Q
 DqS4NgFBe6VbAllxMRod13r85G6JEcTt747cet2NbuSlgSzp0b/O5BPkF6znTIZBueSZ2PCs=
X-Gm-Gg: ATEYQzwFhmHgdcPj/4dE3G6hkKsWHOPyUW/RtXVGpXkobFSs4PIuXuEwdwnqcxg4J9p
 aBWhFk2UZnJWY/yh4k6rmfgUxokZQx84lJWZV8ca/hAuGVDtRgjz0vpoKMbKP2Q9sn3gC6mTnXZ
 q9zzXzKcxLM2pUcw1mm/SgoNOJXDEVSIDL2z3hNeou2Sp14xbXUgRAsoymkvx+T/cDIATKTbk8G
 MpRYfqyP64f7e4gYqlrrsk59mHDreOzxquc98870ifUxO6aSWX0YKa6JgFTp1o1v47yAjcKkUku
 jb/c8mEUK+OfixCdcxBCiHR1F+EQ7yh4exTlXPCTdxhypuKTGHEITeTJ5dvvi7Vdwxva/uLHIF3
 4RW+8v7jm0IY8bOXWGWX/aexkPG9Ec9QxBemgpfGLfCvDe8bjvGJRugaZcfxqWNHEm+vHfGdxlg
 4T8W1ZLhzilOQmHA==
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id
 a92af1059eb24-128c2e0c967mr1056242c88.19.1772812150809; 
 Fri, 06 Mar 2026 07:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id
 a92af1059eb24-128c2e0c967mr1056220c88.19.1772812150163; 
 Fri, 06 Mar 2026 07:49:10 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net.
 [24.130.122.79]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128c3f58d24sm1497977c88.12.2026.03.06.07.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 07:49:09 -0800 (PST)
Message-ID: <00a7e65d-aad3-4029-af51-ff0870e65595@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:49:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
 mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
 mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
 jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
 vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
 amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
 skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WI0WxkGt8uI_79Om0b2JHgUMgfL4_6nj
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aaf777 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=PJDN-9afRshu8rMoDvAA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX0Ie8If3s+yaa
 LBxvyzxKJtCzTBkr1b5rQEjgNmCZ1QVC5XXlo3BxBdy9iA4wHIhgJKg6uC3pLr0fzlmBsSWgq86
 uS1U5rnpKOjAY6BKEvLVwtzGfnCbQ9ZX70UItpVuhhgCGNDShm+wADg1q9vhfXd6IOvTPQkTDek
 uESykz2YKFnNbTkPBVzTziFydwWtyF2pjRtkmTJnVwffCFQt0SbwCqLclBkAqK4jMHuRvHi/1Kn
 76NTNG4Ia4phgji8czlxj0LV9Et3X3omD431Ah948oipl3C3wk4YCCqkSIvxT56tzoGfCu2YjE8
 TrUNkcNk8uhLBpEZhInNfrpYLPCU1fiF0X2dbQbDz8z/gtkF/OBP6TbDCNhMcxXOrKfCOZfcKcF
 uxF7JZfoLjXu+3pSgaRVfWgBmzkE7qKV0u8Wfn0xKwEW3xC+Jcy6v8/NMSMUk7R5G+pf8duwLSl
 14auS2s8KxKiQn2k4tQ==
X-Proofpoint-GUID: WI0WxkGt8uI_79Om0b2JHgUMgfL4_6nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Mailman-Approved-At: Sat, 07 Mar 2026 14:42:10 +0000
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
X-Rspamd-Queue-Id: 4235122C34B
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
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualco
 mm.com,m:jorge.ramirez@oss.qualcomm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[jeff.johnson@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim]
X-Rspamd-Action: no action

On 3/6/2026 2:50 AM, Sumit Garg wrote:

I missed one k-doc warning...

> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware

s/scm_//

Warning: drivers/firmware/qcom/qcom_pas.c:173 expecting prototype for
qcom_scm_pas_auth_and_reset(). Prototype was for qcom_pas_auth_and_reset() instead

> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.
> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}
