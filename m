Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEIvKTQ9d2mMdQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:08:52 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F68671C
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81D510E2BD;
	Mon, 26 Jan 2026 10:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfumSZ6J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Foq99DqR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2C610E2BD
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:08:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q9BsXB1193548
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A7HrPtPPW5vdxOHCGF8VzY7vLYkOmL21Y70PPkKwr0Y=; b=QfumSZ6JMWLOsqoe
 wWV1T5HXf/ry1F6+MM742UL6RTB9z/jBpaZNS1VRUgjHDn1EVyR5O0siWBuZZM34
 962O5MVfhHAkng3zpN7679ePwipMguiMdjcCC339sIpv74qpiGwwGwR+mX0RWA9p
 V2DseSr2bqYLbJWsGMShnmwpl5ttpPNdrn71aV2antZRzM03pexeyf0zhpqtfsDL
 gncyQB2/b/uCm3BxeyGB4j7/mQQsFCDD8kVJbDmGYs3kOPROzJOmrYKzCw/G6xy8
 LzjPdOhUN9IsBB42dtZWmUmi4alaflaVM1gZNGCYrIUsutq7z+am9dQtGS8kfLdd
 yrbCAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hc5gx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:08:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6a182d4e1so92002785a.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769422128; x=1770026928;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A7HrPtPPW5vdxOHCGF8VzY7vLYkOmL21Y70PPkKwr0Y=;
 b=Foq99DqR5q9vv8C64qDOxi/bvzj6B82RM/O5BDosBURAcuoyl9tvHPNTz228b+76qE
 Gz1ggXwDNy4lWgcnwkhBbWL+npKtdLgZxaKLcthGOLNbWZAIQJVO635dbkPMpgGBDMfo
 h8Hh3CCJyOFWHHaw+3cMC0gD8xUWgXTRKr04Y/d2Sb0h4/FXyoN+vhXZ0OOQ+Npp9WLZ
 U5vxy9EEAQGlAY/sJEL1xcLbJf4FmEVl8GXgX5kz8NCX1rlAa709G6vKpyTYm8otepQl
 HSaWOKcN8DjBSs8xlh1/varfHHSCr5ZBp07qogL9QP0nOv0H9XgmlT3MyBOZuonvVsNI
 7axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422128; x=1770026928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7HrPtPPW5vdxOHCGF8VzY7vLYkOmL21Y70PPkKwr0Y=;
 b=CDO21oICAczAdyg8GrdMt9b4k17YP+WMRGj703L2eGErhfnZ+nOroCpmXuniul1zEq
 IH33bNvQ/r8qDKrY5xyS+D0yWPbbe5nP78padGDVSu7JdK8tWnz8tGdg2GQzAyesz5a3
 3SYMTqa5L6gl7OaN+4DopfTKzBoOcQn614zQNF8E69clVIb7DB8mMRY3lxw7IK6P1+8n
 S4Xhi2N38x28U6GN9FnB6erN1jL0k5kbkTzni9qUWBpc4aYoHjnYvPfbVg+dogUI5XKv
 u/x/PxtdX706t/TFXgNcMtE/y1tNkdTNfJLz4wE5ZSaOhnGcHa+QPNUktE4MWwH+GljU
 lKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+OYO5AOoFzjGA1WaUVlS87kLDWQ/y73Hbtk9gO4BNfodWf9X+pm1upqVQoRzEsLIfiCidKGmFEOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuvIsJfEuOI95ra9s5k07bNKmHLBlIRRp77RrUigLDNq+mSCYw
 SZX9hAZQEyv5mP4bg2s9KX0cyNHDpzwnw7p8Tb9AYb01rGOI9tEGWuVr94iWcbZ0+fXnBS+WxNC
 WsZbIjf6GBrmiVS+nRqiLHDAHhtStic9XUbmKgFcIN6JwAiogtW8iuRsUNG7YuZjhyJUlTEg=
X-Gm-Gg: AZuq6aJPNy8R7TI0jHC/Qh/gjdsbQLzPmulLTPLz+oMVsTqGBySrT/r8UHoHQtNDxS/
 dC7yeXWZMNyHnLvUMX9Wix4g96xqpu4Q4vUaqsPECLbw6+G2c/VLMFcrOhcPdAEMf4S1flxde6u
 DJ0/rYotwk1J+JFMMumofPhFDZW71Y4KwFMlWkrpD5CF6f5xt7MJmvKcrOzieaoR84gRCh+5Mp/
 YdTmY9Xe8pDm3vSOVIAzhSH4Yv+B+QdfjwBWPbtK1y8oKhhts9vI7WgYfX12hp8Kz8Q2uXbi+Z0
 9jcnXSU6JDfJeHwfeR01n8yK53P1dCoVkqEdBnCu81SGzVHwU8dWLhdirAnEXfs0dcwcdgmtVxN
 OrWY1Rsw1rUhIEeakiKHLwsqlp0DbAZPJGeVqVUXRE2qafl+OsyLt+iUg5D60ZCcWtgU=
X-Received: by 2002:a05:620a:4090:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8c6f962e9a0mr310855685a.7.1769422128317; 
 Mon, 26 Jan 2026 02:08:48 -0800 (PST)
X-Received: by 2002:a05:620a:4090:b0:8b2:ea2d:a5 with SMTP id
 af79cd13be357-8c6f962e9a0mr310853485a.7.1769422127834; 
 Mon, 26 Jan 2026 02:08:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b6fc498sm604771466b.39.2026.01.26.02.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:08:47 -0800 (PST)
Message-ID: <895a86b6-450a-4bc7-8042-6bbd7e908eeb@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
 <20260124203925.2614008-3-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260124203925.2614008-3-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NiBTYWx0ZWRfXxi3St/iMGXR/
 I3dfPrSUz+Kdxpjb+7qo3ILhtHtp7rpMF8/TL6IKBwDIXTOvorAzys33uiTlwPHeCUbXq0e+CBa
 F6E4nhGQpJbsa9vWq5XqwY+qdI5szZU1arVKCXjKUv+eJUisk9HTtey9X9KqAvEKueFHO5FCXXJ
 8cOp2/piB+AsGy1DHyJs3C4gzb19osy0lEY2cD5qv6NPew2abnRQ79maXE79T87ntPUF3s3ulzW
 6KRGHtJNDsy4zEb2f8anapEObvi5yqqQBj4L0hjFP1I+vc8H5To1uqa+cQP2OuGCdrliAFvbhz/
 PoSfxqX2N0mzCbMhQTbSLRz0ZAAdt2mCCznM+gwGZ0rtYtG96G3oQpS610yPJuXFPJNvBWiGsik
 T9eDz/eAmEagCH6ZUcn5fv46qcg3kLuTk2G95exjST/AjLd3bL/boZ7GbmxTe10qksNJ1NvcvEM
 dmqKkcvbWoSTaJnrIKA==
X-Proofpoint-ORIG-GUID: DGtdJBAVPC3zc-kz8En4Jwwwx4i6Bze2
X-Proofpoint-GUID: DGtdJBAVPC3zc-kz8En4Jwwwx4i6Bze2
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69773d30 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=En4R4P6zDXfLUnqyaIQA:9 a=QEXdDO2ut3YA:10 a=ue8pFixJmkwA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260086
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
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_amakhija@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robdclark@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:robh@kernel.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonathan@marek.ca,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 115F68671C
X-Rspamd-Action: no action

On 1/24/26 9:39 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

