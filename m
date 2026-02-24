Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE9RHZYjnWkkNAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71D1818B9
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B9710E4AC;
	Tue, 24 Feb 2026 04:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBrhp68H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3o2PIs4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0710E4AF
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3LLZh890423
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2UWPXJP1SNxi8mpOlT57+8AdR26SzUQH4u2S6/uF/zA=; b=fBrhp68H8KQSKefd
 NJVDYryHM/H67XJqiLs1JFQlWyfyGEogpPGeJ3hpUicxVKArFr9Sq8GuauqlUa+8
 fMiFKTPJi7xImQL+rBSdKiEfvr9r8fmISrSvxUo+A77O27YqFz/tfWNn1ocUODRw
 atPT4Rs0Mp3rZS+2kT+0LRb8HNUqVl+LeuPqh0iZBtfBYn3ln2fJTqKkpfX+57vN
 PrEu1vtwHaHFNPgfLe0aPOsuJiLmI/V9860rhgbF/e1D5V6SqM+UhYmeXWiWdBdk
 N0LVPYRBCiHaip4s1HtBbmfvr3hi02WcUX3r5wkcQFb04f0pkZ3h8toAOYO6ZHZz
 T73Pyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8aj1x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb403842b6so5108491185a.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905937; x=1772510737;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UWPXJP1SNxi8mpOlT57+8AdR26SzUQH4u2S6/uF/zA=;
 b=X3o2PIs46vjV9w2aInHbyF23ZjSRHvJgnjgDi/lMHUEm3ClhxI/pw5eCqfgmxLkx7F
 htarhG/DilNuMbRJw0CI/beOGw1GxWWzthea8cXI2We4lYhQOk+7hiA3QB+2FrupcCAy
 V2QmsmH3iVOAMnOqe8nzB15fTeY7CySfEijKJLWqNhgPfNEbTWV+7f3hklHvK7uBKJjM
 +jKH1G1bZLIx1/Br9Meb2AHEx9QqY3ccb9poCvauP0ITFCdQhPhYbyb2nt6Q+f92mcZM
 lc5ZaKpow7DgrSDb+xM0G+2gnQNDthT+VbLfZ1B09CSMjI/1zkly26WhaP7iA74BpF5I
 3OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905937; x=1772510737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2UWPXJP1SNxi8mpOlT57+8AdR26SzUQH4u2S6/uF/zA=;
 b=MQIbCNb+EGA41easL38mPHx8jUK1wrIyaXpeCbY6GrYRKJW1aMq++DmqD6DRsRfZjG
 022h0ZjuoxhwZrkEr4j9kslhgxYBa6Xax6Sp5tDXWRuTpViy6GZix/Mkf5KJ/vGGCYII
 vB58Hrosc3zmcuacFinQbSoq8itIijBdBeAHiSnGuJmakgYNAfktuGSo4SjvPciufoML
 5H5xrTJsggi0fzlPPbmFwvifIc5yl5G5swWfIKa3Znaj+XiQ84l8kz7VdKfd6Q9WO2+n
 4fFFOgbkZQjsCx3Mpb2D4Rm9kMxY/y4eTd+CtsGUC5fgle6L3DSte6rStK+qzHKRQ0LQ
 IjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrMTiuElIym1tpxaanQ5fF2S8K0OaEBJQmEM5VovsRIrpkItbzb9XMZAA/+2P6bAaxJhKPqv7TZhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG6JAk5cPtnwzgJXaIX0ORw6lWsgKWZNfsnl5bnYZjqtv99mX+
 3GqMuh5N/DeSwF1iDcpHVECR3y8A7BtzyXG60rqEsAPweSu7/zBD2aYcG3JPTbZvXFMmm00NWcj
 wuVcLTLcNuab+SME55LN4nHhtE5LfXVOO7z1qJJEweN6q5qdZ+yFwkNzNlWz66tI+b59BCZ8=
X-Gm-Gg: AZuq6aIn4ezeIO/5QEXKPMBdgJjPYb0uzsFOvcUIBh8Vj4ZddkfYGeqzcAXCoCwYDx2
 AxkvyzLBPq2IzHuU8+vb80NDeCHicLXn2E2rk1oddctbmjbUKLkBrCkcE+UZZzPkMfFRfAXmFnx
 4SN7wcCpfxcbP02LHycZfDJp7Hg7O4mRg8pxxGpkQ0yxIhdWoRWuOUdNR24/1ToWMluvKEppCHO
 Ikef/ty7iG76K2jNgN2zjuUCNm86HbKn31B8ELSUo5xzIP7wLmcWmNM/oGTVszx4NqdZ+t5jtii
 kiz86IKt3Bdve+pDn1jb/OXTsyifPyGr2Sne9sI9OIRjRoLpWJoFuSDYPXHhNBoe0yirLpdKcyP
 AAGV8XsmUKAX3XvIfxnpyl0BkAIZuB+o2MhRyfdExIzCFx84/w6Gonps0ZrVv9U2Y20TUXIXa2l
 DSRhHxX1Nt5xNAqG68Q9/lGAgotpjQUMs2f7s=
X-Received: by 2002:a05:620a:2844:b0:8cb:3e7c:a4a4 with SMTP id
 af79cd13be357-8cb8ca67610mr1376724385a.46.1771905937201; 
 Mon, 23 Feb 2026 20:05:37 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8cb:3e7c:a4a4 with SMTP id
 af79cd13be357-8cb8ca67610mr1376722285a.46.1771905936692; 
 Mon, 23 Feb 2026 20:05:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Date: Tue, 24 Feb 2026 06:05:26 +0200
Message-ID: <177190591482.429979.15424065965109747590.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX3kG2ITDmYwIV
 Fe0O/podijNvXgxoKMwYO+sfri4ZKAxl3If4KiTowAz0mk5uf8jGxPU3yQv++h1l0ukB+4Q2/Jf
 DJerKwqB2q4Hylfh2cjOLlEuF+JHY+O+QjilgWd7msIY1C0VJ0PRSGu+v/l8c2eucMaeWudGeP8
 Lo6LaWKl48KNXJMnTFebBEOhUOHqzcGExdRR9Zdh7pVADZGW54GDXNt/Uaf4cBMjV6I/1QY52Xn
 XAVwDD5Gw8cfNcKkQ7Sj+GJ4x36pT/pXYqdAM8YWuYw1jHfQy8sdZ9r7M5JTVb0l3t5DtmY8BcW
 Y5fq+IvFI3CdDpsX2L8prSkltFa8+g62+KlZPekrW7Zel2CGXyYznRANIKTfUS7yjp/pFa8s2E6
 835L+urEq+JcRoPaiewj1kyAh1p4Zi38LWujGMjbFDOo7yyW0rW3xwzA5uRt+xvm7soSKttMcms
 6iKk+HR0igKlvx7odbg==
X-Proofpoint-GUID: YKSSPSdfYb1Bilobtbla7PtL-_rnOgL8
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d2391 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=3kVz5KBeNGK-UBlMhTMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: YKSSPSdfYb1Bilobtbla7PtL-_rnOgL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abelvesa@kernel.org,m:andersson@kernel.org,m:quic_khsieh@quicinc.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: EC71D1818B9
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 11:58:49 +0100, Konrad Dybcio wrote:
> The register space has grown with what seems to be DPU8.
> Bump up the .len to match.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix LM size on a number of platforms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f7bf13197392

Best regards,
-- 
With best wishes
Dmitry


