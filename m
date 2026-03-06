Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHEjCkc5rGnAnAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB24A22C36B
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE3B10E430;
	Sat,  7 Mar 2026 14:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iolXTHdg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuGXu0rX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15AE10E3F4
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 20:00:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626H1ZYh4115523
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 20:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=; b=iolXTHdgTdjfeOyD
 ZD1CaIv9BfKoTip56GVafVAI2pWYzNyMQHZIxdjSM97kmc9JYu7asDOGkKqXqzrG
 D7A6EGYVAir86BPd0Fn5Q7raSMDJWV6EdF1O3A4hsajmSp3swGeGIcffEwCsft2n
 6APlbK6ZVqMBM6cG+C7pk5Kyz9Fnh30veQDKzcgTG1qjkwGPUVXTxVRF9i+aiQDC
 5JqWWkql44Xvn6k9P7HX6IFX1mIcJWe549u1vpndfMKiUifO7bDmCekNyqgD56xS
 T/BL//RE4mKtCpeGpFZaumI8aENVJTpmUafJihIs4uiLWyozER6TEuIr1RntP5wd
 ADUk7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ua13a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 20:00:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2bdff07d8f4so9464129eec.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 12:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772827238; x=1773432038;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
 b=YuGXu0rXG1OxqZeDR3avk0E6S9fiDYdJ0KkXk0NK94/KesHyacpphG8t+XjIdYSBiP
 NpCKRuMW4xSkQkYbWpoK+6GpBQKz6sgzZeezp+B4V5NSRT5qfICIMqq8riHT4fMtuhie
 AlyCL53v9hiv5Iz4PHpv4DR/ILvzwfdvTFOr/8kNFQiURjb4DkzbVH9z263d4m8dwlf5
 fu00YJMQHhQGRdVvcC6tOR9F9ucTWO7mr4a5AEs0za7wliWrO9OKHSfZxDcl+h7ZQ8Ax
 Aen1kPVhvJvMDViULV0X+Y+/WmB/FrjbIuKAJQbDkwwaLRcIdEKK1rypGB7MIQ08ZjWG
 Y2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772827238; x=1773432038;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
 b=UJaxceRHpOWx3LNe6GMVY3B6Piq6QR/WtlZI8ZXq/n5Ac1KiHQnbMfs3Q1TcnY0wLT
 ZbMyA7hAA0zuUncDn3K5h4ntRUyApWJ1RciAFs9MuRXN6NQL0fXEDnjdDL0qf5EO/LbC
 c4Sqx7QpOHyNS6lHrPOSCEa73bx/nmCltmQqV/tgd6z9j98k4TL3WHyhY7LYlSHo3ULn
 uhC4pl2LkKCIoUhykZdcA3klX8irDv6OfTb4GsewVE12UNECTMOOfiKw0GRkZRBKJVDV
 PpiQeMOVfJmznqnulbPisbrUa1jD5Oa1Q1RQx5Q/bU0pFCpL9JSWnhf8dLHsowlvPF4p
 hnKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjrbro76fxKRKEO9PQtO3ec/1QatkBhoMz+sMK+ZTkOvtPE+rJppbSQUBR3kzT1LjBkEaVIxELEqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVyeDkavSw7ufkiq8+DTqm6ypi2pfYc3VJKu1Z2AR8hmsxGZgD
 S+V/ImvHScl1zRzCQCJGW7io3Ur4uWYQnQuIAUXIajtRITzk+LELKP7RrcFLs3NtCo50EjAKn8+
 qpn47soVmwnvF9/mGgwtHsYMT5VI4j4DhtEHgz3w8MKVfzlx5jBhN328UqBxFbxm9SB18P7Y=
X-Gm-Gg: ATEYQzxKnL0zfYBxFZdAU3kKoJCVE4cV9tPNM+gkMe66jJtZOFCk+kDpzLmI+6LU19o
 mJXuP3nDX4c1og98gUKvYH/xYsDNpiawExEzLq15OknuBV/ANO+ohphN2Xs8Q5yYsximylwGQSo
 4gB71SrJ3kEsoXPAnABF4iRj84a46EsUKIK+Nli2nRI3V6TyF08BjPksBgwrdEfXv7pFgweh39P
 IQYPOOW40j22iEmlRLhzzk3YhfReRb8i/wJQx6T6FBbEua2vsPSdx/vNBAzUyQt4768PuD+DKmx
 tljl3brEzLj66u1IbH4yks2mPWa94YdW6XZnWSRibAzexnYenjZeejTpp0MTUAseC0buYkoHUl8
 feMGGnVDYGPZs4a9r8gQMQk6o+0kmxeJVKDp2fPwx4WnHqj0791Acsb8=
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id
 5a478bee46e88-2be4e01911emr1342965eec.17.1772827237709; 
 Fri, 06 Mar 2026 12:00:37 -0800 (PST)
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id
 5a478bee46e88-2be4e01911emr1342841eec.17.1772827234438; 
 Fri, 06 Mar 2026 12:00:34 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f96aa3fsm1798784eec.24.2026.03.06.12.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 12:00:33 -0800 (PST)
Message-ID: <973acaab-f2fa-4e2a-81ea-9d7fbebd1ca4@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:00:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
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
 mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com,
 amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
 skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OSBTYWx0ZWRfX5iTVZZgPdfki
 qLxQZBpnDIXZpEfYyz5QiRZfMG7G8w9XydtJC9+gbP0CQ6yVNI00gGyUwzkrDhLsXICHihLkdqI
 IxK75fevhVyCSWrE01nABp3urD71fQBawKxEuAULwIuwSJXrDnnn/i4xq3xzn/tKMre8PbRQXIM
 RgUNlicOHC4gbyXpGTOVqn0NUUxpwtE4Lv67jaYJuSHeLiX9VrYhf9mjEbzdXfaFv60W7Pud8NI
 8oO3/LxHPLYPuCRZLSBfXOOqpSYAD3tvRIJeFIKEPk5g3yPVJxGNhFXkHf7AELiwtpmQm4Mp9zC
 GDmUvDkjBahIA6wx1VuBKkAFMTWvamSQ/OC61jFgaX2WS6Kv+fYkvLDrDBfAfRloBr4zpIgBJGq
 /mC+pJ/SmCCwDQeBINL25YLi08/nV7/9Fsppr1PKvBl4xdOkyRLNDdJPpyNEFFPyybekwo1IB1R
 fgmQXVnweIRqFKBNYeg==
X-Proofpoint-ORIG-GUID: nKUSIQnx15PVZ-KdNmb6J9PDR1KDdIRO
X-Proofpoint-GUID: nKUSIQnx15PVZ-KdNmb6J9PDR1KDdIRO
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab3266 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Dui5BcQmNnZPeg-S7-oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060189
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
X-Rspamd-Queue-Id: CB24A22C36B
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
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qualcomm.
 com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_SENDER(0.00)[trilokkumar.soni@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[freedreno,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>> new file mode 100644
>> index 000000000000..dc04ff1b6be0
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_pas.c
>> @@ -0,0 +1,295 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device/devres.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/of.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
> are you sure you are using functionalities from these header files?
> 
> I couldn't find slab.h usage quickly and also qcom_scm.h. Can you please confirm?


I scrolled this patch too fast. I can see slab.h usage, but not sure about qcom_scm.h. 
