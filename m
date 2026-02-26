Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM8WOLxaoGlPigQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 15:37:48 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD81A7B3A
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 15:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE06510E95E;
	Thu, 26 Feb 2026 14:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIP+FHML";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6hz0XDi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F296310E95E
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 14:37:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAKlP0906787
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 14:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=; b=OIP+FHMLn2yvrtF5
 +ewAYmby+R+lSHLNMgAEeYyOIx6mq3zMIWdCGDRCizVhuYpt2OFMdF2+GCpJGEaQ
 SobRXaCUckNuM1dV0/iQiFYyk2eW8UCiR2/gDLMCue1nebLg16XEANd9AGwgM/Vb
 awvyIYJ9wF34IEdPWpw4T5kAqw+yM7f5Gso7SPf7jluXGuCBvm1t9Pk4Ll9WDDZa
 zRVGmkDkIgu1aAso5i6Kwbkg7AmZH7nSJ7b1BxbZ6GlSWXlzE8FieqpO/zTEq1Af
 qRTsWU2dvT9Ce/4E8QTRrbD4dIZVMnKXKQutcMjzDkZvTq/zBvN7Gv5vtNA7H1O7
 PtWdqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v10fa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 14:37:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb38346fdbso72042285a.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772116663; x=1772721463;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
 b=D6hz0XDibr6JWuL0S8waLoZdsnk6+2q0t/ARReeBv6x3ttri4Ra5zi1UQoP5dv/eKl
 +4y1Hs4nX1xTjJ2BnvENO/AO5AA7jInVDUZZ9CoZGr9hxm/JrA0c/LDn5qroOBZ2L0+7
 WDYHbk8P6dVOSv71i/6nrWcTh8NZeSMsp5/lLJaSz18GWvz6MyVj5ANt+85OXEEO7ycP
 dqeO+AviGVXBVaDq91L3ImM8/CHHiL/2SNZfBk8bCFZ9Ftg5iaSalTTQNYEN9ikNhKVc
 oXbgPcmVa3WpaJPhEeiE2DzbB2UopZTx8QeQ60y5JWwrQm1kTvMEfzCkl9zeTxEbA6Wv
 b3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772116663; x=1772721463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
 b=tciV/1gVi20W5Q7G0pi3Wi565kJcn/SXSqre0D9EYjKPFIfFUPmCQ1QnL3oakfFPRD
 zbJGY2Ql34XV7P+KmWbcJoZeJzshiKYekGAWhb7/eYEggDnDFMegisVQCPKt5s1zdluV
 KciTYWh+u3BN44NYiQbyw0RMTm7gSIh2NuZC1PbgyM2Tyy7g3B659hPHbGVahYz8ilPW
 J0IwhBCqFdmHxtg53vE4UTS9hBZrKP76DK3RwkR5z9c8nTili1x6g8Q+JC0l4BzK16g6
 CdasEQ6qEBs4tZBzukYxiBqTL3Ors3I3Mu6x5E46i/tlL0ucY97453AfWkq7Em059lTE
 J4IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx45TcCI7m1mnmTaz0n/RbwpZeR3fCwEo0VQ2iWInL7J3W+UWfn3FK//yegyVtCyaIz2xPNth6ZQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMbEb/ZH9f7yGq5uI0bcX3jFiTFyXcBxxDMQ8xvmVeksjv5u5Z
 UhDGJ0QQukHm0+tEerFOt2H/7Bsytkmtnu+kJQF1iKd3/t1mV0LKbNbQxcQj7VveFHz9fvBFSDu
 LsS/Nyzd/sZmzQMxdMff2jWGpduftxDcSi/BZPa8W1HPO1Sh9ORYPT1nHpRUQl0XCLWt3waQ=
X-Gm-Gg: ATEYQzw00F2RP+8hcpqPlXP46VSuZcmJZRIK1RrZHPKniYHHjO606949WaCP5U/rRjN
 HEkNatyh3vX8RPqc6x7EhUOe/wkUADeSV/RugiT48sGqNzLOPfPA43GyUnPieCK/VxKcdS0cvC+
 LqU+u3hENuQyYD94R0lrBsyyQjYQdFJVdav0VAkQeMg8z7TKNhogwKZSk4mHLlM5gMod6NjCMNw
 uzzzNKdbgg3RxGtBmk+i/WgG0/nhYsfOl8i+YIJ93TSmj7sD3BmY2k9rDfQEfl0MMtz+4uNje2N
 kEv/ongN+CWNsUmJV62/v3xQtO+jUiKS1DkGYWWi409WOnW+zn46vGwp/oLpKAsBPxKv6vkY41B
 2vn5OmtNn6P0WUAEmIYg63VXddMT1uzo6QvLkKipmgIQaGPTUFMD4dfkLQFCAjBlaEvEp9opQ3D
 JHEBA=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb8cabef31mr1935603785a.7.1772116663447; 
 Thu, 26 Feb 2026 06:37:43 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8cb8cabef31mr1935598685a.7.1772116662812; 
 Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabf6d1c6sm509000a12.17.2026.02.26.06.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Message-ID: <77f52ff4-4b6c-4f50-bcb0-51b89e67d0ab@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pxN02OEwNbOzsMNXpTzvcICzDi2g8XFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMSBTYWx0ZWRfX/2pBOmAIAjXJ
 nYZNVcnlWCtZmZLVdkWXQicH1ULWUjNQphfIdUh44VYLGpg1QguGPUNtE6lTGySVyZCk75MaJwg
 581jE15uw1Gs5iaGElE4UbWl3XkW8CIx894e69wUyomL+XUjbul8N2xske+oXNAoAkHVIuXHHRB
 c/XHq6re3cXx+DqzR4RVLh/vP2DFY+JhGrrtJ16U0Jt4BdpQ/QxdHWmWqS70Ws4Ma7RkuPoQ5GV
 jtu2sPtPqQMJ4cFxGRcaf6SDwC6Ftbze2CKJVC/BMMA2CIrQQnxk1gZBESphn8xdRfrlGLsQC4X
 8W158RaI+zRHltEUdZyGMehExy61BnNX4ZFHfEgkMffKPqR8eir0DGFJ0FLmVE1XzYb7ZKgOZfg
 74YA/0FWnyHWCmMXOBApbL3azAEhojiEWkPPXatSzlkCUOImvdaWFsnt8Zl/Scqj8tKzfuYZM7p
 hK5f7YYoEvd3p9+6Q0Q==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a05ab8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pxN02OEwNbOzsMNXpTzvcICzDi2g8XFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260131
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:quic_mkuntuma@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:marijn.suijten@somainline.org,m:swboyd@chromium.org,m:mripard@kernel.org,m:abel.vesa@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:jessica.zhang@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.vinarskis@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:dri-devel@lists.freedesktop.org,m:quic_riteshk@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 37FD81A7B3A
X-Rspamd-Action: no action

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Please switch to using b4, you omitted including a tag you received

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
