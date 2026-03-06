Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOktOEU5rGm/nAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:13 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3F22C34C
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E1E10E429;
	Sat,  7 Mar 2026 14:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfSjst4G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDJnHYhY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363F210E409
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 22:16:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626KWZ4E3193042
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 22:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=; b=SfSjst4GB8hij3Ya
 xumyToC4COQ43yIm2aQSarzCnpo0ypGv1UWid+nyf1aAiMF0Mu+lt8Jlnh6wZEzC
 z4nAMHqTQKPfGzFi4Ldw17z950DNAf03OiMcQDe7wwE/yO+WD8U5uSjNlAz+xe+E
 DI126rXVobs/QALLHK6ZUrp94YQkgg6+6YV5FIgosf83knfO3y+5DeVGfbKpw505
 0N1VQxl+B1ZgE5cgBtv5aVouUiY6VafcBs3QVFZGcpXdHBxf4sdQkDacB7oeO5Xn
 213NzZUpLBiKTugTF1ByolEGCHvJCbJb5CxMg1cmT9VYtIEhF2oy8+NVVw03lLlg
 Bzz1rw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2utrywt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 22:16:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2bdc1b30ac8so958425eec.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 14:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772835376; x=1773440176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
 b=kDJnHYhYrPDLp/vkKAP/puMJ8jJjxMQlDuKBWcED1n6xCu0klQ1+Efvi2v/sj3U3v3
 /nrK9o1t0wFsscNxn7QA4z22Vz9S59qfHnALXTSsQw/jgkceiLsKTJCjySwTE1MBFZ2l
 oGGxdoJQJBM26oUiaDvRbousdiyVh3430J3KW2k9u7X6/ItPnwn/CvsJ2vB78CxJhWVQ
 TO7e7aN2S8hqjc43qYNd2b8WqnN/VKGOAbnC8fZTjU4mMyn0l0a95QXdj6CC7ncR5YE+
 Y+UtY+VjuBiw9+QrWdhM6K0he1wLwjWnpyIqiOA8X1SVntfRfqqt1fND00Va37IgkYre
 adTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772835376; x=1773440176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
 b=ux6h7nPHkL3DMpEdgSVqeG+rO80BC+fgUFaTGGLRF5BNJka1scBopeWe+07aH1i6mh
 iad6uHDAEePvYPWo+mbpPY58CQTz5TbSdhuXaqGlLqeHVzcSapYAIzucOqZLgcTyUrAJ
 YTq/PGeFtnqLrdDVwA0tHYtTYm6P69i5gOhsUguBbTTqYBeI4Cd6pAgVL1xr7kPlsurG
 zb3nPEb/+WejqweuGExu4DYTBjrRoECd4778HBx9ASZbWEwsExSx9MWFkylNkzaP++yK
 9KHUGcBoIb6KA4YtBscd77SggC6vhrlPRWwl2MHy8KT4mKJ10bK2kelVP8mREjabRRMx
 nV5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLygCFJx0enZa5YlS5Onzegn8QauMaJwQKbRDiB+eY7Noz7mppwZm+p+PhWc++kppomXorr0NPpOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL4iWwz80DcSY15o8Ncr9EIpdju8yZ0fJZnc3fYpi4RHlE26dU
 Q2xRvFSajAF7s+NLYueilujBaGatZtUWuIFCBs/AnQzwTie2PoSLgPhHVRS3aVz17QfeVDFDbou
 usKUbnYHjjGkfcNrPf0SFnLNyaMrBGjJWNTcJvR/R/JuBAKmvjXvKN9xKZPrlZ12bVgZqCjs=
X-Gm-Gg: ATEYQzxkFcJNWJVOwyDljPoYesSyAF1wCw6yabnriDokI7yRUHSgpLMl1H7zXSXrjS+
 wcqtt+Kw7t+J4qRaytXvzY57+O8K5WqzmyLNZ4aaWfPO/a7PRq0O23ALJSPavA3UhuqVxtg58u6
 J6mbu56B6xeF7cgTSgWhdbwRnGjikqEbXdW9w3BAQ6wotu2anpPQ72fgionGI84zGuj4DY1DX0N
 F11yAF7GOy2H+dlDYaMYyRBYzRkSli+By9BWiv0zWGEAoQpqLhHONZvu0x+2+r7Y3ddAx29vXU4
 jWK4YzbFWIf755J9pEN9efuKfV/WYJ13c3ylzH4evBgSd7ApkxUUiWXANtRSVtP8mn4vY2y3klv
 DctLPiddewsB6pxye+NqQnF3C1diJlM2HnY5I2SU4bTr3tjmiDR2p3KfKbn1c22VFvkgBJe0IKs
 1hb2bH
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id
 5a478bee46e88-2be4e0655c8mr1446303eec.23.1772835375707; 
 Fri, 06 Mar 2026 14:16:15 -0800 (PST)
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id
 5a478bee46e88-2be4e0655c8mr1446255eec.23.1772835375083; 
 Fri, 06 Mar 2026 14:16:15 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f94823esm2301765eec.20.2026.03.06.14.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 14:16:14 -0800 (PST)
Message-ID: <f825ae05-6285-4d10-9d66-578fb1221495@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:16:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
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
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N8ok1m9B c=1 sm=1 tr=0 ts=69ab5230 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Js8INul6CuAu6eKS1T4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOSBTYWx0ZWRfX5Um6Fh/7aBa6
 5a+lXF0+NSExdwhE7x8AGOSCODcloW7/UZtW5OcfskOJ1em04eo+V+O0puz0ApjsKqwglTuLTLO
 cyvF+YRiwVw6w4lk8J12TaJTk2LqAEjtDKCUdu6HdYzf4Im1KIhJYV44lXLFZU6IWGV08xSJ2nL
 jUJcmENkGIcPqiLoljipO3IEo9jPx3RL+LcpBgMDkBhTh8jvKamQ+WMCklVdSbsV1WhOE0iu/4B
 XyjGgLnNWw+eYzUFAO137K23JDMJj7z758oq9WqZepaa6IPQwezIsW8Oqd77HWcjrUJCp/RVCh1
 IAv7Czw2Opx29B7RS3cL9mXojWuaU35IFZWsLf/WL8QRa6zREO6kSkHU7PIggssAkQlVqPZsugq
 cTutkGwHaOJRL3ZdvGzFy0PQtETLGbS8LrwFBRUom/iJdwMs3qNHsGkX7EKzYBM2IlBjCMwXtLu
 b4IaxG/G9gHpcIGfHzQ==
X-Proofpoint-GUID: rx1i4Y8MJBfM74TCxz5iOjxlfsQwBuIu
X-Proofpoint-ORIG-GUID: rx1i4Y8MJBfM74TCxz5iOjxlfsQwBuIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060209
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
X-Rspamd-Queue-Id: 93F3F22C34C
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
	FORGED_RECIPIENTS(0.00)[m:jeff.johnson@oss.qualcomm.com,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.c
 om,m:jorge.ramirez@oss.qualcomm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/6/2026 2:00 PM, Jeff Johnson wrote:
> On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
>>
>> What is the convention for Qualcomm authored drivers? In some drivers
>> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
>> clarify it here. I prefer consistency here for the Qualcomm submissions. 
> 
> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.
> 
> And in reality it is very rare for a given module, over time, to only have a
> single author. The git history contains the real authorship. So just for that
> reason I'd drop it.

I agree and that is the same guideline I follow for the drivers we write
downstream. I just want to make sure that we discuss it here. We may not be able
to find one single solution, but I prefer to get consistency for Qualcomm
submissions. 

---Trilok Soni
