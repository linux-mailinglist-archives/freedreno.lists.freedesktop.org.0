Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMLeBkc5rGm/nAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B122C369
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3EE10E42C;
	Sat,  7 Mar 2026 14:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3mV1Ri4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AChhY0Kr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ADB10E315
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 15:40:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FT84j027811
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 15:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=; b=W3mV1Ri4C0Kr+8NY
 z48jIL/Lo5XCeSg8j7D2tMGiz+BixeS5WwAv+77z6Xtmt3pR8njgOFeAZk6HFWcR
 Oe0ZKlLov/jk7pnvYIKXwyH7MfJKbX0HuZ2GueDvAeOb6k9QaQmPqWmOKdAR59pn
 xQjhDSAc5fiGNCDUU7FsPAQh5WM+mj27lJKEClXszb72kWsUAoqrv4mtMbX+Efv/
 m17Hp96OLfYiwK9tX1eSetYWiKUrZXXbobABTIeAuNZmIx4touC45LQCSaHPVUyp
 yRgXXe4KghrLLTAyBzGs+Hpwb/FHWFSoJ1U6gIwIWeqQFSbJtg7+w8atgfY78i8S
 x/xrPg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98h555-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 15:40:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b81ff82e3cso4755340eec.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 07:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772811609; x=1773416409;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=;
 b=AChhY0KrwmjL+g2DFr3cAD1bKwc4+T7zOTwyn6uEidmN/Q1uzgr4zdbo9Eto6y/xz/
 G+r3wrGq67w78fBlRuMObIAl/r09IHjn+6mEOlsPXHZJuueA42A1h+7/TlEhGzQ1OMWC
 DrAN8+KwRXITd2s3pZ0V+uPEqvjRl0RySIRm68mLv8Ym2gg1EGsSJjqyyLVZk6N1GJO7
 BHyuFQZollK9fcSS2Uz6cVzmzhjeLC468KCC7f6HgZZdsE1LqdsJwPQ7zSFaYirAHTDl
 RTPuHBx24TICYqGiPExJnXQR/v/VBpE4IbfBWPsVbrn4mmqjoxQXseAXJgkyX1vRbzgF
 JYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772811609; x=1773416409;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpH7c7MyE5oMPFius9rdgPXUx1Fgj3bT2b7iRgr/UYQ=;
 b=ao3oOwyKyhAVNQVpWRY0j7vsfToaCgLZVaQDa1oa594sDbVDfxEDO6ABbBKPHTMFaW
 Z50OiWdGPOec0gDe6P3OzU4A/YZFg1cuoyiWBr4HxbH80DKGUT1BXg+YP4DEZ66UjDqZ
 PyyZpxCVGkhUh6uAa3kfB7ZLT1kdKVTjbI6G3LZIBsocOQZFIvVzGN2hBJGMCDlyGqXK
 RU8T+IuRY/DJCuej20DF12A5TQi0kkxme2Jv/cQTFWYxp5Iwa1TpGAHGByqH6+4KDC82
 La0v9CKzU8ovWOVxfavMbX0uQs/pKisbaZcdBP9sMeZsNjOZTeMwytJVH9efGD3vqcwV
 UbBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4McHLfye2eVnkEHyWNMaZb7Gl6wm1JkVVYZ/hzZevo8QRr5TBbgQrRJuxRJhUfsO5fRHUbJpzKt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz04ykj0AmvGI/p6rGXA/4lQfcEzo4kAVZFXEZaYtvp9sAnionH
 lcjC2z4+YOEfR1h6wGuGOxLk39IJIEpelkQL4UEdg0gdqtQyyITCJ6atPjwicY3QEuFOtBNorA1
 aon8FHqzM3pnWc5oU0TF/Qr0YedHJWkiHQqQ/dm3LpcjmugwwEQmrTXXur3eKpBHImiolRy0=
X-Gm-Gg: ATEYQzyRYbgtzggLheXcKTV4X7c5lgqXljrqN+95cDWfcGGGDnmHyMiWaYzv6uauxQk
 FYm7OClaAoST9ofYwdUqytTUIC0PN9CzIggM7GDqC9KOUv0WKDemPtfRQejRU8cY1umjsQs3HuJ
 7/SyrYc2lA8+kdEnPOuC8x1LTKk5UoWXg8PJ4i4CACPG6H8oGW8xsqZ6JaOy1gINf7MJQgIAfq/
 HMWfivSaluCfTfx5t2G5jG1WJmUGQvVW8jtJ2TUyBk/kmGfbxsJUs3v1TBgDzms+ZvdnyYNEcaY
 twX96eYlA/KPa65TtfqtiH4Ixu8oX7zYCzCRrMjpT3iWuxppUZBOLTEHMG1qMi1dkIzvpwNTk26
 DTq+dYOJ9SMnxe35VmO11Awd718kgx6Pc/m8Mj/pG6IPQJ/nwhYK2SrFQoYnS1mFz35ku+NeXd/
 CxK9C/2iD2BJGxEQ==
X-Received: by 2002:a05:7300:ec07:b0:2a4:3593:ccba with SMTP id
 5a478bee46e88-2be4e56f9f9mr928830eec.1.1772811609195; 
 Fri, 06 Mar 2026 07:40:09 -0800 (PST)
X-Received: by 2002:a05:7300:ec07:b0:2a4:3593:ccba with SMTP id
 5a478bee46e88-2be4e56f9f9mr928768eec.1.1772811608557; 
 Fri, 06 Mar 2026 07:40:08 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net.
 [24.130.122.79]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f94833bsm1356612eec.18.2026.03.06.07.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 07:40:08 -0800 (PST)
Message-ID: <9741588f-e6a1-4749-970b-3ed814399a32@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:40:04 -0800
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
X-Proofpoint-GUID: kMQREshhFlJm2x78AS1XuJij1cW75VDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXwsYUexjQs2Gv
 PNW19dR1MepK0dkNqA5WzXhT+cR629fyzXoWqXbRmn66KfBYGjmSBAyQnSYZ7MMjvBeUakjMqhU
 ZWVcN4O8kxwCMsg0VLvaBZ/YvFLzhmV/BFdf6CrDA5wKo+hy49oVXoNYm1ptcIXNuH3meDJVv7t
 eQnb2R/nFG94gBnePn8yl2kWuvxVse1CXLKPUCslGKZIc0uTR/sVA3mPzZ2UEjJHZ+lt//MDtDs
 MMLrpA5XLTt2OZ5nAl9RjmoJvXop9e9/3Btzy5WHIOQOZo+tMa9uRpG4CXtX4qJhAxbQKNsDo3/
 cjA0QRKUdBu1eBYWUFLrOzWPukjsXBQDrgQkjglZ3F0eAZUNioBThw2iI7hWg6WUVTJf/QHqxq2
 FYOQ7uTgsgAV0jxxDvuwFFMst4/7K4gQ7PGx19ZkdTz5XkfrZaxkWOetTl2YOkWysphrUWjBpbo
 Gxqr6gSwdTbT4tTaFuw==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69aaf55a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=40pWYZonmZhD7659SdoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: kMQREshhFlJm2x78AS1XuJij1cW75VDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
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
X-Rspamd-Queue-Id: B74B122C369
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/6/2026 2:50 AM, Sumit Garg wrote:
>  drivers/firmware/qcom/Kconfig          |   8 +
>  drivers/firmware/qcom/Makefile         |   1 +
>  drivers/firmware/qcom/qcom_pas.c       | 295 +++++++++++++++++++++++++

kernel-doc is throwing some warnings in this file which I've listed below.
kernel-doc is also throwing warnings in some of the other files touched by
this series, but since those are presumably preexisting I didn't bother to
mention them. Just want to avoid adding new warnings.

>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>  5 files changed, 398 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
...
> +/**
> + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> + *			  for firmware loading
> + * @pas_id:	peripheral authentication service id
> + * @addr:	start address of memory area to prepare
> + * @size:	size of the memory area to prepare
> + *
> + * Returns 0 on success.

kernel-doc complains:
Warning: drivers/firmware/qcom/qcom_pas.c:103 No description found for return
value of 'qcom_pas_mem_setup'

should use the kernel-doc Return: tag

 * Return: 0 on success

(Returns: is also accepted although not documented)

> + */
...
> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.

hmmm, kernel-doc didn't complain about this one so the script must accept
'Return' without the ":" (but not 'Returns' without the ":").

Suggest changing to Return: to be conformant with the actual documentation:
<https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation>

> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
...
> +/**
> + * qcom_pas_set_remote_state() - Set the remote processor state
> + * @state:	peripheral state
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns 0 on success.

Warning: drivers/firmware/qcom/qcom_pas.c:217 No description found for return
value of 'qcom_pas_set_remote_state'

> + */
...
> +/**
> + * qcom_pas_shutdown() - Shut down the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns 0 on success.

Warning: drivers/firmware/qcom/qcom_pas.c:232 No description found for return
value of 'qcom_pas_shutdown'

> + */
...
> +/**
> + * qcom_pas_supported() - Check if the peripheral authentication service is
> + *			  available for the given peripheral
> + * @pas_id:	peripheral authentication service id
> + *
> + * Returns true if PAS is supported for this peripheral, otherwise false.

Warning: drivers/firmware/qcom/qcom_pas.c:248 No description found for return
value of 'qcom_pas_supported'

> + */
...
> +/**
> + * qcom_pas_is_available() - Check for PAS service
> + *
> + * Returns true on success.

Warning: drivers/firmware/qcom/qcom_pas.c:262 No description found for return
value of 'qcom_pas_is_available'

> + */
