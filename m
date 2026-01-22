Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ/JC5d8cWm0HwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 02:25:43 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD75604D8
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 02:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477CD10E05C;
	Thu, 22 Jan 2026 01:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cs2UY99w";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HW9tirjx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1DD10E090
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 01:25:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LMUBsi4057304
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 01:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nTDOIcglAyeaV3ZEuS/tgzsB
 4te1U5wxfUmhA9VBRio=; b=Cs2UY99wmNX7qH8t/z+XqKX4/jbFTsyEPKVXQ/Xa
 P6HHPW5MdNK4ATUf9C83y4hJYa/E52C9NGmEIhSY2rVeGIdcgupSXMzrwO2/8FzO
 cfAzNQ7Y/914ilwesmnZ6QUNMbA27//XTXPWvF2vKGFeruKQ8gD/hwkcIGPJpCOF
 0h0hCFJA/3l25DVb/JlMUJX/6ydBUbjsvKYfRTrj3UerJaIuknv0ILb3c3fiqrL0
 M2sTanjQiWS7QMnKOKzApog6eBVDl4KmMzbe85OqpacVUJbMm9QOlqCf1XoL0ue0
 CDkrPr11AY6UJhAW6oq89h3Bd2tsycdJSy6b6hAMEbdE2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbrcus-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 01:25:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5296c7e57so161794785a.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769045138; x=1769649938;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nTDOIcglAyeaV3ZEuS/tgzsB4te1U5wxfUmhA9VBRio=;
 b=HW9tirjxIhd9mRbANxDTKVhkEmBNgdvVyLBOYtDqsijZ18kPp4NJ7a4bDwNixyxBJL
 Z/CfQHM+JISQK9CTwYOwK/3J3z+rBtljfgEV7Kh/U8RfVEsKpycCmwxCOR4qeiuW8LKD
 +t8q6b0kqW7uQbjuHM9m+zbsyGRTKgMPdg6wc7MpSmMZZcdMnAeZ6clWV84TeByMwCRV
 Ne4JCS4lXNHmmxaig8+muVrQWWERm2hhBBvYs1wwyqJlMPKUKefYsiREOg2MMhS2A2Pv
 d0rBEdDcGyrc0G0amRl4opt+ReEcHUf9mYqd6GknbJKNFYKhAwUfmXTSBQvawPinminC
 YWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769045138; x=1769649938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTDOIcglAyeaV3ZEuS/tgzsB4te1U5wxfUmhA9VBRio=;
 b=ITSS4v03RrpnLgFl4RsqHAfKrfnmbPjyXWj+S9GZSyfm2cXXq2uQvxe1TH4UbVBebO
 +axceAYknrrX9X+k3J6L4tl8Lr5DvmD6KVZijcLuEIMVGRpFDThfiDD3wCdeTjutpZ0Y
 CCJobJ9H++nb3aqgbII55CJqdMnIJrBDyKGC+bSHoOu/Vx7mAESuOQl4J7C/KxBfF68e
 dEurVbG0EQ5wYZcxN3+s7Xg+7dcp+dPMg6Nluo4I/CyPeTN0i638bKjPrXRf+6MlRHIE
 GS/EFuRcW9g/RctgnbAlhLRPik6sTkmPjn33B6BazIx+jcbff+KN4eo7GiqTo/Jwh/IE
 jEgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDD5CXZTAK9de9WWF8i3Nv7k4pRdBtCbir1KRc0DATuaaPU+tWQC9xiT0bTrTWRvzLNAvSqOo7Eck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsxnCv8MomJZEJZg7z1K8iE7C6BCBHZpU2R/civnRBMI35uujn
 CA5nTKORz1OOJ4IxlaGESwliszVmwRwV8tZXC2DiOiR2XrEga+KUYnKNuVDTMvk5f+BncvhRqlI
 po3xw64KmSjGt+mXV3vxCdVyrZa4qNvrwOdKBss8MLAl7HQWDRirBLW07GLBABxEnKndRuZQ=
X-Gm-Gg: AZuq6aI6yoO6m+mr7caxh/e4R9GSGRHNViyfnOk8+SvQOdX+eLQTiEVK9TSUOn1S5vV
 mBBrbmg8x2po5H3Ctb92t3sWIbf/rD9QklKU7uiepqy92FgbTFOeKxhJquTk4Nv11ILMiqKlWsa
 lvs0pLmV8t9eTI2t7L3bLMkN8vASnDZvJeOY3vlAESi1Pr+aWOQdV6NJ8ExCupezCnXsAuxbqyQ
 I/XBQZsG0WVD1FtTn+qN1SHb71IxhhMEaC+wDp1iokw3xFgozxhyFxQzqCQ3Z4Nkrk7JvhPfVAl
 sldPCnu1TIshY/rBuVKDcnRIlD3nB22n7alR+mCQI8Xws3ftCjKegi2fvOQNhn3dMOwmWCvh0cz
 L5Gw1p6zrGJ6Z5O773BHCNQ6jUhgUC+qh9kpH1qGalvtolcazBK1JTOLe6B88sBS61bEx1vZPI/
 SgptCIyIDVSQVGRgbw+c2/l48=
X-Received: by 2002:a05:620a:1991:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8c6a695659emr2710436985a.44.1769045138426; 
 Wed, 21 Jan 2026 17:25:38 -0800 (PST)
X-Received: by 2002:a05:620a:1991:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8c6a695659emr2710433285a.44.1769045138026; 
 Wed, 21 Jan 2026 17:25:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385c933b014sm557071fa.11.2026.01.21.17.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 17:25:36 -0800 (PST)
Date: Thu, 22 Jan 2026 03:25:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: document the Ayaneo Pocket S2
Message-ID: <ith2qszksbrxnbnt66ytnzuje5id2iexzueuyjbftb7t6ijmnt@rgejkddzzqea>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-2-bb3f95f1c085@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-2-bb3f95f1c085@linaro.org>
X-Proofpoint-GUID: pxhFZSth7yjmPknlFoQ7wVDL5ElhiFtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAwOSBTYWx0ZWRfX0kbo+rfdcaKH
 A/BPF9wpJWGKJt2ABpA7ldc2CKqYoozrMnMAQGuVxkbF576flODJPpgxgE6oGsEaHwYRfnTcPY6
 GceHiQoGoGcPjb3DM/beKnDi7on4d11tM5ih42CXU2N/ABZiShDvfhaY3eiwOxJurhGYWn6Qu6w
 wqD33Jh9HO8vVtc/yv/xvQJobztgo52DZ7ZWDurTt9vB7K1Wfvw8App98g77SLpWNGDPKyNoNZE
 V38vjtYaefCMiN08kUFbzpR61bew8kwpJ24/7l4ca0cqEaBEspjv/lytKW8bwEkVn3IKkRrXVyT
 Sus7soXpX5/BOdpDu1Hs8I282UZ+2dDI/9DY+Mv1JQ0IrT9DjrNgWx6iInPBWKkuVyIbaABCaMf
 VogfXUJBlaahjITag6yqn4VPjr/Uzo8/BBjCpyuk3ete1DfankQnfWlyXkY/tMTLVoY6rPd2cI4
 NBSfupDV17bD8vmnNRA==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=69717c92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=CiRNHZe3ZleBFWjHar4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pxhFZSth7yjmPknlFoQ7wVDL5ElhiFtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220009
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7DD75604D8
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:40:27PM +0100, Neil Armstrong wrote:
> Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d84bd3bca201..c6786dac5b59 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1045,6 +1045,7 @@ properties:
>                - qcom,sm8650-hdk
>                - qcom,sm8650-mtp
>                - qcom,sm8650-qrd
> +              - ayaneo,pocket-s2

Shouldn't the list be sorted?

>            - const: qcom,sm8650
>  
>        - items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
