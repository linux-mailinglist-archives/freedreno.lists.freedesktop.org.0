Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACC0D2F32A
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 11:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A69D10E84B;
	Fri, 16 Jan 2026 10:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjNX+hYk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORP1eXaS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED62F10E84A
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 10:02:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G807V83074934
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 10:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=; b=SjNX+hYk+L++tlmX
 2gEpuuzA2Y6ksLIaoiZLTpjWm8hDcO6wMAWAXcYe5bY3e3w22TIPCFsjklvPapC3
 DGL1YTSTbOS4/rAgGuUEJpMQdwLBRWNZ5a82ftzt5gMdqEvSrSbVGSNQ8I1aBOdx
 Zz7nnOHaNz+maOiksL+acfOG1KxBQ+wLCqjRHRWGDTrKk4Mzb2ILskRpRRo+T6IQ
 hyAcvtfJB6VgmMYlqQaS4uugCOzdazPH0wWXvpM9ftUiE1b8JNAd2fhQ+sUmPHWB
 oab9AZTeEj7wa+P7tAay+ypYUTkZ1ZkNWtXqqQe7X6nuiqbHndXqwRFmzcIXLWVE
 TGd/Mw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jsqvd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 10:02:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c532029e50so61851385a.1
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 02:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768557751; x=1769162551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=;
 b=ORP1eXaSke2yyNNw7Lsp60COOr5rA4mUVtMIy1rF2N7NK2PhK78Va9wOHmUYDZ5kcC
 GRgO/PqGwguhmxGyhhfUa1lfcGUGHvYRi2xldPs4XsyCvBZlgQ6r2tMOcgSaKgfs0GTx
 KrIO6b572G6ig7ha/u9m1oUgNekKTuvdsiosxLYPKCTag5ICxnpiaWdwysWkoqb3FPw8
 8SorQ+nESMA/NyNk/Rm9XgRtiZdj/9mVbQvl9yul6aaGmEmDb8WtLdFqg2cvTU6iUwTB
 lxu+RE59Rt/14VhGeVNORvFp+hJCUnEACqgFpw4++MkC1GMtPekBfQHlmzt3lQUEBq1W
 27iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557751; x=1769162551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJbND7y7LhcOSnxt8iwVxIRRefUPRDr+wQGssLa1ix4=;
 b=CeYnIbNRNYKhS6AXHMPWW6shfizhro8eztyVRV9MQYa1g59z04smty9vbqqNveGTSx
 mKtjFAzyTCwI2ItdWvdGAG5X6fLXyjh12NuPl/jXF79S5sIZKU+kgNoSQIEbrjSkIP6g
 erDLx9UlutIXhta+0jr90z7tm0VVlcEWNgv7Qv4ARBiwBVmWveEzrNfG0RUuoyG6OZMh
 vyjjYN5DE/XZMKN+xCFOxuO0CLwHg9VcSul38rGW6Pkn6Y9unNohom9MQS21ixhDrcSO
 vh0X7z61WYxLv1V8VoktkgGNBPIuQnTdMWCRFpzuDllZpN1pIdSH3WCcaOGNV7cmE6T0
 XP1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvyUcw/hdVhq5L5O5XmsThWioPLEW2HK+PHzw4vfVaKpd9A2xtXSfE1TnZbFcYja6ylt8W/CUsl0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUoxQaShv8/t39nZazOasJ6tniDZWav+5eX4vLoocA52kxplaI
 e8Rr9u+76H9/GZQ91sQRFVCwH/BYVY2T/tmZpZWsTqSiQn8E6fUnaIUoPZpAZ29Iwi+XHnRZgov
 /3Zb/7MGBYxlUhH5KvaNHDfQh33MQdYAeW2siPWMst7cBrDKQK0+A8oyqnDPicigqOu2Espw=
X-Gm-Gg: AY/fxX467SGXbQ8qZR1qx3F1EghqC7ATLTGipSKdYNlxcQiaOtVEuDVKoMNYg+MX2I5
 ClibEVmE5JkOZjFGYiPB+Q7nurTD0E/t7Ux7EiNiG7ub7E3dOrFY2f9B2PGHVi1d+TZ/16BbGHr
 V/hYeHHsgETB08oMCAdxAy19/h244owJklYn1sXQhBfoGGKgTmO9+rA9dkD5gT7TA2XqscSBDe+
 UBdvtiVIpNFPQgaKYeUGcpaUZSWeCPXWA05nv6Xe5s39ec/zXc6z8q5eQ18XY0zz0bFRmT84nOl
 qe9yOqBFYunOnkT7OJO7sn7IgU7BS20hb7tU20Yno+CaYZ2o/nixKPd3QAg92sXB2T6KYJmCbjM
 jvLGABvg4p/qLr3gQkVToM28G5TAc0n4pAiFYGBFL3+jpRF0CdU1x/I/nkz0IKJvi8bE=
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id
 af79cd13be357-8c6a67ab9d5mr216409585a.8.1768557751193; 
 Fri, 16 Jan 2026 02:02:31 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c5:305e:ea16 with SMTP id
 af79cd13be357-8c6a67ab9d5mr216406585a.8.1768557750716; 
 Fri, 16 Jan 2026 02:02:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654533cc4b9sm1984787a12.18.2026.01.16.02.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 02:02:30 -0800 (PST)
Message-ID: <fb19c7cb-96bf-4abd-94b7-9d5eca07c346@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=696a0cb7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-oCr93RSJmR9oNbpFyEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -DMobj_TqHI1-ZQW1N--G43_TaaLcXtR
X-Proofpoint-GUID: -DMobj_TqHI1-ZQW1N--G43_TaaLcXtR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NCBTYWx0ZWRfX5FDIOOxW6Ifa
 Q4dRQRgmPn+K9FJtNZNbMrbfJxIEQlkgURW4Ic7Hdysl16rL/WeM7PjS8zNXkMmiO2SH0qyr1yh
 mfBpX3ufFPuIZEZ2xkfgbTl/45guNTI9zcgVnrsQn9FB5i0V3qTMQH2AazMbfSZyREoW5M5dBGb
 9cy+zdkCuGVzxqPoFmO3yBVASbrrU6iwVmlqVisTIkw/Zr5XjfEpSC31hgPP5c9CwpdWlpoGK06
 0zULe+MU77sQT2Qwk+1J3MTjaAzu/Zk5KNyGS8B4qTf5/fzm9gD7WYyt5q1tWEoDaurzB0DjyPU
 v9Y9FCWcddktEmQpHvPp5x3khjKt+MtSjrvGsRk9DCiJX9qA/fkdwcVhZx3s4JrmHfPAsjQH67w
 g0vjzfa2Gvzkx0W6UsRHV9lLuNf0IRgS9QSs99S3bma48jwJ51b2vB73LhWu0TeEMDAY+Zq2XfZ
 CDXxb1VVZsjN+pVuTnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160074
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

On 1/15/26 9:05 PM, Dmitry Baryshkov wrote:
> On most of the platforms only some mixers have connected DSPP blocks.
> If DSPP is not required for the CRTC, try looking for the LM with no
> DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> those.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

