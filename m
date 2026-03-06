Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOfyL5KYqmmIUAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 10:04:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE021D94F
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 10:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE09510ECB4;
	Fri,  6 Mar 2026 09:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC7Ygr6l";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPTpexRU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2F310ECB5
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 09:04:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6264af6W2328038
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=; b=ZC7Ygr6lpr2kAY8X
 IgeJ5VxLfrx0j5WmTRV0Y68+fmxoCbW0F4G9ynmzN3VnGUECIG5SE/b7Wwii9Rxr
 Pc89fgdKfkQBDrUEE3oOMSGC4UCgaZM31DLJ+Cjv/zPGjxVl4eqYYiDC8jVyFJ7f
 Q6LkdL4nWyXKmAHiARAvyCytv5AtniFZN+T79r5GmYKVIRjygIZetPOlgDqspSwd
 juQqKYIwdobBmuBxS+mCA0lNi8DdQpxq9ixowtHN3kJwAeQRmzVTOrfQVzeg2axd
 +h0lorD7rnvQ0/W4d18fD68R7acYYEKlR9harMg739oQarhcJMPHvmlnjOfzoYv3
 32aJ7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09td0m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 09:04:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c710279d57so612538885a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 01:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772787852; x=1773392652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=;
 b=fPTpexRUoUuB/p7UYs9iDG9+m1fBcAZ163MJ+FixHHsztt9FxdBkGM5cAKLEdeSjFl
 4woKr33Ua8TB9KG7DsBOuM+tqTAWLYd6pnBvWo8fbl6SJD4CF2czX3/PKtulyVVzp5ei
 Oyw4V+PPa1VgEFVkuD3Libh7yiEjHHhyaaoTvVZ1pHC9SpJYn4vSMI4M2du/CNq0EFDc
 edJKb7tL3Glfr1abR9egxmftyBcpP5QuIV+I+d55Zug29JrXkK/4L1n5mGQNLFpBKeqX
 w2AF1njDgMh3FOaM3CqYRl6u4Ni92/7pucAoF8yF5jafW3BEf96dJ2732LUPegf2wTqd
 QAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772787852; x=1773392652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=;
 b=Wg6UacOQFFxtY8PjwFx9FxR4dwCT8v3DceyuG7+0NXvyYft9SI3mkHE/NcvNriaP3m
 CtsJu+dtf6Y4XOZWYxs5GbdYvUkzGBDxfQCJ13A/yWGrBGGsntLrjfhd4hUtfuPVXDeI
 ufOfgJCHTlFfuHt2HjRrFrgTAYYavhzsuiXDL/SnG7zpKAiEnreDvWTRDxNbwGww7NlX
 EZe9gp/dUyfQjquM5x7amEc/O52Dtt/aBjUMB/N0PRVJ9V0E0VaoqZqZs2NRVSLKrjwi
 iu/pD75lkvNvmiYJ/FNJQLWjyxrGUMVhoONaW/A88VHDGrdGI8cKisuUcAZrXshFSr3F
 XVaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWmN8bwZZEj8vOv74a3tqE8RVDsdeIFtfUekt8jUeZBsfA6lgpLGREXIOp6WeRXwr1vnmLGmAr12M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrMcO+tnhL4R9xRkX9LSEekCY2vQAaDPejexVn1SRkGv347DrX
 X5T9opGwQtfV9hMqgkKikWSBIlNOACfSSHrRByvvdoGeObVBFZav8oIXdiu+BJY9mLnH+LEtGGa
 yxO3yxxEJtu270Ho6TxJ0LciYGgfw7b/4G0kVXOKliIe+U2ggtnaTWzebWeTYQycZ5lmwj2U=
X-Gm-Gg: ATEYQzyk5kxnA1HtEqoxPGYc9M7IOjwAGQZ0+ciIu+K7AStnNKTr+rej8NvZQwfOycz
 nE1cWA+6Co6uXIDX9GrL72vVJbvIq2Rdkfa1lJ4AfKUB6nmNdPilglZlJYQPjhL45m4+7SJuJzE
 KTXjGpEB4Zadv00+3EmFvjc4L+tn0UgL9aE5SR8/aVD1tIOaM7Goq8oiczOluuyemheX0yR32Su
 rhDlJMnNQj1ETEtWuXUUHkqePSjC5vFh/hIu/vTFBsgEgtuHUhcIX2aRTns6ujebXzYkE/D0TSg
 DEXAJ1unHD4xnqLvbY7QPha7eYEHo+nt1+gzdY/nsnmDpe8zsWLHBpSLjBMtuDvpqXgQvemCW9r
 33tr3eHzdmOVNy1e7zfKP8LJUbT5WaPDDcS6Jur0wADD0AXxg1POkaJln1T+/fdJPw5RbvFKMOY
 IehNo=
X-Received: by 2002:a05:620a:4892:b0:8c6:e2a7:ad1c with SMTP id
 af79cd13be357-8cd6d43c6e3mr137002785a.5.1772787852163; 
 Fri, 06 Mar 2026 01:04:12 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8c6:e2a7:ad1c with SMTP id
 af79cd13be357-8cd6d43c6e3mr136997285a.5.1772787850777; 
 Fri, 06 Mar 2026 01:04:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b94351894bfsm16204966b.1.2026.03.06.01.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 01:04:10 -0800 (PST)
Message-ID: <344eea89-e7f6-45d1-8413-dc238a73f200@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6U0USG_Pv_dLSJICJW1do3YAkLawSf_u
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aa988d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sCGn9XAE_lF3poFM8OEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6U0USG_Pv_dLSJICJW1do3YAkLawSf_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NSBTYWx0ZWRfX/vBWk6PDPr1E
 zcd8QGukYkQY/TI0eAy9D9YEa8SA7THazCWhuKvYx0fTXa5Nq7RVp+qHVG56Efa2EOhIKoE08zk
 vbRgMq7fnBoUSxTfuknwhW8U5onaqbQHKtWNxcBgkFefEzSZ0cpadBNnHLtoQjpItZsdHZZpx9K
 zBwiX0E+ULebqmD0Pt6boVDfBEKhIeDY6o7fEl946LvVya/QZ36YaHsRslC7L+QXEApDrYiMOMn
 YH8GnfdWKHThLFwU70rs1LEOzzYFOCwEmgw3kEpPT+g9Q0AmSUBmkFbZCWnJ9FCYYVsR5Y/DJ+F
 gn/HWlV2GuhL0f3DcUw/eiwqBevweazHzLYWCTeMXTzRHXCxVfjyPbmO++orq1GsTYdRnwCfMhi
 zC3Bxp8i/zEqS683NVbGqjp3BMOV7zNfbsoi7f6Bct7iIlRwRONpdj6B0iebAWCYugek18gB8RA
 cMw/IYTI9/u8PrhD0sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060085
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
X-Rspamd-Queue-Id: 35AE021D94F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/5/26 7:21 PM, Akhil P Oommen wrote:
> To disable l2/l3 swizzling in A8x, set the respective bits in both
> GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
> for Glymur where it is recommended to keep l2/l3 swizzling disabled.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
