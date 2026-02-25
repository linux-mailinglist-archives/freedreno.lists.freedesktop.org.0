Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB8FAeLWnmkTXgQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 12:02:58 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012721962EE
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 12:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C909610E010;
	Wed, 25 Feb 2026 11:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj71Lqmt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJETFIKN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C508610E010
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 11:02:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SCeC806796
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 11:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=; b=gj71Lqmt+QsOGcgr
 QT+C7TeAdLB/L1JHGqTi8D/KxWELRfsdmDJmi3LQ4jfk7jgJXAfoR3jMEiCh/A4p
 IuSEij9RaDPh5u+qPfjaRs11yqB0UUJTpgFu1jbCheoIicN87s2qN+RDVqDjRBTM
 W5B3X6WTUhNqG9MV4UzwVpH8gY+JaG79UGHkHcXtQ//rcdCTpbor1KCxTjG/P5+V
 IMnJwfSUCHYOgKKtQ7dzF0ADhUb4RDSKNgk4OJzmw43W5VsGM6t9v+hg7J0ifRB/
 a+aYiKW416s9Fqaz5ODWjtPmhEOfVUF3bnS6KKHLaDF0dd+/GsETlalDakED6/07
 BVcTfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p9cpe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 11:02:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-899c0fa75b9so50876d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772017371; x=1772622171;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=;
 b=DJETFIKNu55+0/It0Own2Mi5rebPop7AXORaW2akqkUQsWqY3lL9zmvYkFnzxJOpxB
 gKEyrlJShvoEj8g7KiR8EqMxe56aUvvRg1vobdxZ0DoYgNGMj0YjxqxTXVP7gJDTvXHB
 G9KCEEX10NOPSRDcDJAdqlWWmltZDBm7tK4H+Hw0U3rxbK6TXKItkT5IgCknIDUx9R6v
 ozYgj35A2G63n3RAPBYY3m0C8+i7cgNVXVqKrH3zUqjQfrNAXtzgKnGZ2+SJZJJPDsjc
 418/8uuCRKV9a9TLdKwOSlK8GfdRm5nO1PAlg7/zXKyFuWAfLDNPGhaWmlxaJ3zsxn0b
 hOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772017371; x=1772622171;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCehKZ3CTAFQvrgMAIAtSRO7mBHF3+IpN0ZUYoyGgrc=;
 b=Xj8nnjdLTOyrf1tZbyIupbMwgP8wkumJ+SEWyRhhRQSOjBIwY5d4EjnyMbMvr/n6Iy
 WSWAg/2o5dXHusuDrj1LLWgH6e2rQxmTsWPF2Mq+r4uJsTdDyefViX5qxbJo5MMx+xe/
 jFmgQsuIod8OB6Q3iioYNZMxW70NXwRbTg9K4cRJ/NYwSpgbF/GSgm+j61Vkw7iC0xMy
 yuSkgMc4vZSIXyohmQWiWZcRHrELvW/rmCzr1WfL+xdak6V66Li49Lwt8XPVcczm/Lh9
 o0Yh8oK3Ls49O0gpdiT1JTDh/QVSq+cKIQmLcKHxMqLKl7V7AyCr5KmJ/dNJU2z9Q9mt
 J0Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU665Dzp00sCD2aIHCEL/HHAlZf1X+OC5xK1HpQrgUXKtbek6Gge4/p/1BiNIf2FlGo+Wlkp8R+9+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwupkXNaKv0cAFCTGXxo3VQI4oQfpHnrTqdUotExSN3t4wtfuOW
 1yAM5J5YfHxEOfN5S1FSs9UmGlu82KsKCdJqhYjR8SKLaow2hleYXfG/fXWIKR66mO5isa1q/m6
 rF0R048KFk7ChPDUoopQLy+4YnpO6ChlX9ZOG136tMoEp9hzFOiK8/w5u5Vvanl9RufTvoME=
X-Gm-Gg: ATEYQzx/QSl8Q6E0vsIXqtLE3MCE25lRMh20xM3AM1gyJf72Nc5B1P7K1Q0wNjJyp+W
 +I+puArOynW0o2f7MF2eJoLAcsWl2yD/jGm57qb4cdqrhlmvlL1lIswoMPL1hiICuR3C131ekJ0
 OeHJfQbIIEsBMxfT5kNcojC0dbsqPOgN3z6mqJXlhlCf/7lrTAiaLhSXv0NcA1NP3h+/5OtX5Q2
 G+9ZcrOQOVaOufuUamiWNKxie8XawVNrr7uRefD8pLRhI7BfCqlUWbhYOnTxsBGRmE2BzdrXUJa
 ZjFhtEAWvazR/2s+aC9DVgdRHZCRDQYpwpwTobxrE9QwGB/njT+zgAjkHLqasWCeOlVb0bTm+4f
 DWXLI3eHp9eEbCmVflp6LGgLonWQ8kR+Grzkxn1+fUwDNifaiW49HbV3SIuYO7WvkkWX3HjR7P3
 rAZ3g=
X-Received: by 2002:ad4:4ba5:0:b0:899:af95:397c with SMTP id
 6a1803df08f44-899af95776bmr29743376d6.8.1772017370982; 
 Wed, 25 Feb 2026 03:02:50 -0800 (PST)
X-Received: by 2002:ad4:4ba5:0:b0:899:af95:397c with SMTP id
 6a1803df08f44-899af95776bmr29742886d6.8.1772017370450; 
 Wed, 25 Feb 2026 03:02:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c824e0sm511254766b.22.2026.02.25.03.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:02:49 -0800 (PST)
Message-ID: <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Krzysztof Kozlowski <krzk@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-analytic-economic-parrot-4c3a45@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNyBTYWx0ZWRfX6fDpCe5EE4aI
 9ejka0KUBAjPPlCXF9t/z8PUXYwuQC6xWyA1I6CsAvU8FFqyJFQKFuYjRi5bXKpl9ZPNfKGBJ1c
 e362a3lvQuGUTNo0sR77Cx+tzS8a0ksXZIzVwPONKGn5STPnBYcvFppWATwskUnQ502PQJEVqwa
 +aa1P+aH1C4VtK1DPX1x4X21z0i6gMPhq/gGDc2Pnb+L1Plq0H3WhG6Gdo/Jo0LkPialgFsfKwo
 q0D1qaz8RG/0AISEupXBWNOampXhbDMKmfwZ6F1c1jp85qRDts1fNGI7p0k/6XIhqRPNgetN6nC
 490F+pqB6h/jDWVN/TLbqm+DOFIihpnQcGCRW/ZGLV8qBv8aos7dpMFJgUVucZckhlKOlnlcVnX
 ry+2Ak8Mo/tKUBQNqlQMw5zWxNd6Box32dhaWnodoW+jlRwoCM9b2WHbDdu84UJG8LLfyQyA9/t
 u0Nt0QYtDqwumjApUFQ==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699ed6db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=iltczeOmeScF9XLDky8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: M8O5eUmO5qcu3IYmu6ByOxfuVSyusuPx
X-Proofpoint-ORIG-GUID: M8O5eUmO5qcu3IYmu6ByOxfuVSyusuPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250107
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 012721962EE
X-Rspamd-Action: no action

On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
>> Document DSI PHY on SC8280XP Platform.
>>
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index 9a9a6c4ab..9223af1f4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -23,6 +23,7 @@ properties:
>>                - qcom,sa8775p-dsi-phy-5nm
>>                - qcom,sar2130p-dsi-phy-5nm
>>                - qcom,sc7280-dsi-phy-7nm
>> +              - qcom,sc8280xp-dsi-phy-5nm
> 
> Your other commit claims it is compatible with sa8775p, just like some
> other devices here.

If that helps, they do have the same values for the REVISION_ID registers

Konrad
