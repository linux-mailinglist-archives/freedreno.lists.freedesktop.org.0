Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AcUDzeFpWkeDAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:40:23 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0391D8D12
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56AD10E4C1;
	Mon,  2 Mar 2026 12:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gmn8gQjv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+LJCTjc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732010E4C1
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:40:19 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622B3djj3862797
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=; b=Gmn8gQjvPV7RgiQQ
 l/W6sb5vm9S22KpwW4+rKScxxNtlZG/MFZaPrW2RY0nowZ66MrMJWEWEU6C5IsOp
 0aXYT6MazeeXf1ueOYX3WZQJ1kQu++d5LnO7AzXOziK7EiP/7BLNkpQN2Rww4jyk
 BTm+tPeoWVMTf++FmgkRbc38D2Lu26SzLuEAQDOecnSTbA9MKcWtMkARl969w5m9
 iCLw8MUPUGdu8FY5hXvZA9be8b3kz8KZVaGwOSudHBlTyUtzJ56GFYYpSAfiy5dV
 2KOxN2L/oxu+DRC17u5zne4ePj+ZG/yZHhwnTM4biIORjISCaZKN5e3RPgctam8J
 5mhw5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjg91f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:40:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb39de5c54so417577785a.0
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455218; x=1773060018;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=;
 b=g+LJCTjcizYynGd8axRzbJoCC5PBCU4taUk65G4W4HNhz6LcClTJ9yywWcPbDxWCDj
 InNeBfW+NaciNh419TRbP25GW3M2z6SFejwzdLwkffgLyf4Z8qLcrbuSz10n3ZFONUrM
 3rxyUeZbPj/sxEPCKNitKDllxdAFtD4BKNZymqZImIR+XDTWlS76IGW0VeH/yPkoB6dJ
 1NTBamV7LiqgXgwVbThubpQfdFw3jUkrpn8PABybwBUxCf6j5M018zXHmmDrxQOIDrzm
 WqS36vT0P+QJJ4H0jUk3YWWpwgIL4W9g5HPJE9tZcsZvzA+yoic2JG/iueNwXpwddv13
 DEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455218; x=1773060018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=;
 b=QiQUVqvuwqg4a0c3NSuHR0eWAvYzHxoqaX4zTcjXPCu4MYcU4trggf5sPsMJoo8UhK
 CARAHyCzvBhQkptBItPTDOhsffZCCDHKOsoJWVkMQlJUbkoIb7VgEzuVjizOB3pCJf4F
 bCsHh9Uiwf1GoL59nc3iR7wrX4KubNH9jvCgprqtxAgiY+sVG4ZiiZmm/k2p9RRc5ets
 3Yt+goX6oNRazSa95j/RKScTLsUoanQXAkKi7g8akLOJtIi3oWZCN57mKl2VUfKlsEzv
 CZY9N9rIxyVZYOiDafOTzMGfgt+ozQusygyVtoLc8mlxh0eaBQ8CI61HqqW3rzleOk14
 SzFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0uHYXgmQ5F7CHWtVW6+EUqVWt22lbZ9kVt4kw5oCoKJW+RWeVFrCbm0sXFlPJqieYD1GXJhBj2UI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCLInbB5oLuHdrViyk1xHlt8cnOfMrlkvum+JALp56cxAMvLGi
 IVfhwZ0BzFG7ZQ0+9el1sHPbcJ1krD/SqboDLJsM/+2oTkE9TAXV/gsF7g8mtBtMx7ipb+/32L1
 iAi2KVUDunAV20r1ZLpV9VONAz+XmLsE/QGyJ+cQ/11dOZ+xPJp0HaM4cY6wiqceLkRUi21I=
X-Gm-Gg: ATEYQzxNO/defHGSWcrIr47fP0Yaq5lB7o20IRDB0cUwkeS05ZG7jSLUvaBRjKbu3ec
 SeI7yt3AgFtkaCBQHC18BlZhBY7748tm4+FwbknOjObv43vKEqr5hm+vYrDyDXXndiqafvfqkWT
 cPxIqX31YN8JbihFxmsViiJi3bH0j+PmVO/fpDTRkS15q+9KzPfmhMXS4dJBisSWwvdWCeI6sv5
 55dr+EqeRr4eo8mMSANNNaw8kTJAdxaKdfMpidoITlV4fFzIDTLbo4ENyIkU7+2WcpE6aEwIPhr
 2QHgIQfkPjz+ttTpzhfngPtTEZ51tQ/l1pQGfKfDXGdoQiUF/FppkryYBS5L7vqFYjQ7Vqq7tOz
 Rfn7MZzJOf4mAmlIMERM8+utxmncA+/QXed/Y2xREfCU8WDcEYGSzqFIPF8uaBnvmgElhTQdhP0
 cYt/A=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id
 af79cd13be357-8cbc8f467c1mr1192647285a.10.1772455217963; 
 Mon, 02 Mar 2026 04:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id
 af79cd13be357-8cbc8f467c1mr1192644785a.10.1772455217516; 
 Mon, 02 Mar 2026 04:40:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac51431sm467420666b.17.2026.03.02.04.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:40:16 -0800 (PST)
Message-ID: <8a2d1157-4761-42bb-a95e-77a851d1f13e@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/msm/dpu: replace VBIF-related array with bare
 pointers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a58532 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5LKdAdAFkQmhlfp1ZXYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EoogyORg6oQWr7TDffez5O6pr7IKh2uU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfXy5IdWjkEgXmA
 mbOya5WrBGdC2Qw0TDlaHxNK/kaPhf1G/SKEGZIOnzyP0rLrtbFAkeAlQViR37ZOxfYjQNdv2E6
 kIY+505UcCUm6r9T1KIZy/4pbR2iaSbVEqsJDkm1UAhVqkr1UCHohFsngraI5t3WMxMef+AnGWx
 RYrlhAI/XkmeEira1CcWGNjDjR76HKJvdIXOsXYzxl+whriwClDXdVOSyrlAHaFAkjF5UeG8ZJY
 CkW1P837op56RIEmBWAefBGad8Gxr1JTydf4vc+D2i8PSHan3F7FgFzrHQULAT6GMSHfj5msyU1
 C7ypJl/rYfNBoLYgChnXTI9BKKt6qN3E8BPdun/qBxIEBqwNEtbHNWBl/dXqablhRNL3MqzYELX
 yENSKe1crcZi4d2jJ3BPwvpZ3v6Dxs826jDbYnYyXhC6lOqvADj+l+Eq1Kpg7YCnUyx3kq/kZvJ
 qXAIMTEVcqsnZJqBrkg==
X-Proofpoint-GUID: EoogyORg6oQWr7TDffez5O6pr7IKh2uU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8D0391D8D12
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> As we no longer have multiple VBIF instances, it doesn't make sense to
> keep VBIF data as arrays. Drop the extra wrapping and keep only a single
> instance of each of the structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
