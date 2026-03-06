Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM0EJkY5rGm/nAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:14 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994322C35C
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4410E42B;
	Sat,  7 Mar 2026 14:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZFxCCUn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d11j7NfO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DB710E404
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 22:00:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626KWYOB2041573
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 22:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=; b=LZFxCCUn6WpNEccg
 RJnzb64jVXdN3+LfB8r8zhZFKZvCxW7dwcQdYCpWhoWQ5zLxLUR1MJomYdDYFV7g
 52tgon9P+7hTkEdj68q9W2y7TrE9cQcZblIsqWVLvUR4AykkuAbEZdh0MT9gpOUz
 yn6Ebl0mn+fs0Z6dg+vdt16RUdTBDUpiWWvlf7fRoTPE4pboJgPsI061h4SS/io3
 Tp1FjnM5LfCpfd+0/fC/vvDevcujlhfid2NYFvI4lIa8Tutb81vWpz2IIkl66HLU
 0uPflehAB6a3WuWNrav5pU+XcrN8ONqkeOcPSYbv0jhXD6lYPAb8BSyHjYt1piO9
 kJQLhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5u70t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 22:00:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2ba8013a9e3so9326704eec.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772834455; x=1773439255;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
 b=d11j7NfORNse7KuKn/CW5rMvqZP0HnL2XKa4fn0o07R6RuEQ35dTr6u5jcdz5Mvhum
 bZToTT4rPCtd7MeO5gYqt1bPCoge7Tf4px0pvNmHjrmsAJ8NmC5mefoRPZFwlvQzzpoo
 S9TwN7Z9hzIwRVmJ2wGg6u8+85g0pz8pMIc9zwrY5NFAzOD0fwzVKSu2Kze/gvsHkWOZ
 gmRxAmAAF6fm3QGlzStxiwkNNOsjxdK4h3sowQG5Xx8e6UlJ0AvHwKFdhd9WaSK2f53A
 m6ii/BpMV/5RNM3XyX2Hg6Nbst06xFUiBb7+k6pwaiZVW0QyJfZQTfB9r8JSV/ovrUPX
 +AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772834455; x=1773439255;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
 b=ZWQ081fyMLHYezVvPCsN9UMy54+po0HvkPKaDerIJbvIKogb50Xd0QZ3KN4jwU10E9
 NUwF5NWarI+D7RDXO0euZrS7R4V4GQD6qeAm8bP7lwinXrtUDG1YK/2wE1HyqSxnRzfB
 7/T+yuIAfZGTsQiVvSkZH1077NZWxVjzaA04++TyssQds7I8yiuC7V/WKOgyiNlBaDfy
 i9dRN31rRbTA/xnrd3z8vAKox2QeTTLs3EITk4z/RPduMYsTjhlgGUM3PS9E7+FImhv9
 xxPTT/9Ytmy5+O6QU+p776Aye4eeFNPBhupe9iP3RL4J6HdTVCw7XQgBu5y/Hu9qAmZr
 o4OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2oQe2X8LbWAF4R7OWxhYyXLMuc4f7dgIVy9uKBsh46S9EDNuj1WJpSREIPIAWatQoZcSysUa5jIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwImD4feRPuJhTBNYGIeH9tDECAmdC9VHnL6kJYVQqr46EGL8AS
 JV1K2xw4XHE5ROMdMYvbH2U7mpHrvP1JnVz1WwUZop7gNln7JE7vjIJEh/+E339ol1CBktD3hTJ
 ypDZEKN5B8VyHKCneXTed+DLp71WAq470lor23uzwYDDTd+EVHmq/b5zsyb0Kw7vPwzZoZTs=
X-Gm-Gg: ATEYQzxoc8qecyzHfKC5oJw91vouICUPf6dWlOaf0AOrkwWMb7WpCaHnIphPTYXAlt7
 duK1CO8ubpAzcY5AWLe8k4Q7h9eQRFDbHenZNDKZuxfkZsGembhZPdppnrgCSPIL9hVN5qMBeHj
 6C+8TYrsYrawjwEg2p1XDJvees9SeJ7/2ecCjHfJiRP4RpQIrvdcKTPymehwXUMRi7EAE/PbB8O
 ZxK2rnx9PTuXGqVF93vFl/NA1eqUjMNVZIKvOonk9gPGmo1bkm3mrNfm4qJVWodjm89IMyuqYll
 cxJkVsgnQzcJWPbKT4Y6mhAucUPcB0wUHpDasmnxrLGdY6CAwHsdYMK2KUekD1wtuqU8HNpXN3c
 N1nnj/VzjQVQ//HJiq91e1Fo5mXGx1YptFOPhWITqbCm6vf+fxxl7P/+ADX5AvBodpzjmmIMEH4
 VEUD2kzgF2I7S7lQ==
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id
 5a478bee46e88-2be4de8f969mr1272733eec.9.1772834454917; 
 Fri, 06 Mar 2026 14:00:54 -0800 (PST)
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id
 5a478bee46e88-2be4de8f969mr1272665eec.9.1772834452873; 
 Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net.
 [24.130.122.79]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f80cc1dsm1962924eec.3.2026.03.06.14.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Message-ID: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:00:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: saaNaNFKkv81V4a0npTAuQZfgEFjz-fw
X-Proofpoint-GUID: saaNaNFKkv81V4a0npTAuQZfgEFjz-fw
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab4e97 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JJlnT80H4U8AMWgPcGUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOCBTYWx0ZWRfX0BBgR7bV8oXK
 CEkqAN5YDvTmKJ5/n6ZS9PIhHNuzocmjG5L6mD5U5XAA+JnQT6ymHP+Xni6paZMnlcXJIsLgxnJ
 UvgIJ+yGs1IK6V2a8F+7h49KWWObbB7umSdc20ezs4zuLBFc87cFjtM2Y0S8zuQJvW6xKayStXv
 SbN6S4RZ2h4rxymjH5fJzexK2S1alEqujFE8LBqc4OUV6rUbWVKN5gWv0Kq0pSkd3yZv+InwRvC
 I/RJLpoY5NYr/J+wvgcAPD/CwUoZy8RAkaDez/8MRPLPofXdV/DeLEULoePjoCyvj9j62Zr/DHq
 LvaXQ04AUmDY+Qr2D+CSxOcUHQ5QqLkHx2a27OSUFLDMvPkg+Nq4kjwSpc2xHdjz6yPsFE7Jqn1
 5V7cchFDNlPpcS581G9ow/j3Jyr50w5cEApYQ0ihXZDtBI0s13QiB05to+Ms+6BlcWhi9rVULTC
 sTV6T0vLafxas+Dp54A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060208
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
X-Rspamd-Queue-Id: 4994322C35C
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
	FORGED_RECIPIENTS(0.00)[m:trilokkumar.soni@oss.qualcomm.com,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualco
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/6/2026 11:47 AM, Trilok Soni wrote:
> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
> 
> What is the convention for Qualcomm authored drivers? In some drivers
> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
> clarify it here. I prefer consistency here for the Qualcomm submissions. 

WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.

And in reality it is very rare for a given module, over time, to only have a
single author. The git history contains the real authorship. So just for that
reason I'd drop it.

/jeff
