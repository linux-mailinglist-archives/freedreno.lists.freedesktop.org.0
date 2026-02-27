Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF0HFNLjoWmUwwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 19:34:58 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55101BC05F
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 19:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2CD10E126;
	Fri, 27 Feb 2026 18:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSd9z3Xb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFALw3pq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A010E19A
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:34:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0GNp527257
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6haVS/eYpEqKdgXDQM+xM4e3
 rN111AJOPvjFmNUU4uA=; b=YSd9z3XbdA0/o/vaX7meNHc/RW9jd6rJuUPnU0Wc
 gYsrIsf2fFrUQn+jVKbrxfqXR8ABYnwUU6IHa3q2qcAPJb0hOAiaSvquCAUzRw5R
 u51Og6HuVONElhVhlaoF+tqDwXx476793j0gEngU+optdsbsEwZELhoVYIjeYPqe
 itHC7jWpkzeJYpINhWLOHzJK3zfOILu/hDvGP0tWKn5XGMPG+YSmMJySbvo9yHlY
 i5HV3lTupbmGdjibHTvQ+wO3+5DLXRrM4cNneDG/5g4YotvvXd1Io/UNi1746f+o
 7xwzr+o7t+mKRVAx0TunP6n5ASf83Cls/w05nKIp7+6rcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23bxeq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:34:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ed6c849so1771594485a.1
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217294; x=1772822094;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6haVS/eYpEqKdgXDQM+xM4e3rN111AJOPvjFmNUU4uA=;
 b=kFALw3pqKmkRcLXt+SVGwWYkOeN5F5X5A6VZBjhvzpBmk+HWuTR6/4xXeyOzT7en2P
 Hqbd5YKYK3WRhJoG+tFURDM7BtskHo6yuUbZgo/rmrWQ5MnYDp6K8k1x0KNNzQxFxpg8
 IS8RGf0EXoaRJXD24Z1GdU/fBx4C6sbpzskS+Esj56sDCaWyiGXaSgXsFyvbw/jZ9uHp
 t/l/5Xmh88EYB/nEkqwaK4Py8rBe2axbQr1e0tocbwnZbPY6ySA3USD2vm5s0necJ3Z0
 IxAFCR4UH5IKjN9G8xePJkuleP6GOcOQrzGMRjv6gVirMbIuUwHnrWqnMI9Rm285SFuU
 +pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217294; x=1772822094;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6haVS/eYpEqKdgXDQM+xM4e3rN111AJOPvjFmNUU4uA=;
 b=X/p33UMEO+fQQN3ZNg+fWMt5RKD5FAwF9/EoJIZSJenXih9uhkPOcOeKfg5Z+MGcOl
 Wd0WTMN2oqC4iAkIf+gF7bY2lzQBjRQs7rYQk1qvkIPz3Q4rOOqr9tzegNni151bCzYF
 dyNmJ8qEuiG4R/Xc631e/RUn0OYqWPmNafvAn17hOEnngbWOO3z/bcK3x2HEReuj3F+c
 Y4uoTyMKU+UmKWzLuoWSaqwxy4awQ/VaEbWT+d+5mh8UPFyd7fdCZDuZMWJhWCJSpsNX
 3t5cdOtytxVEegSE0NW+neeePzdPK5R3/uAjZ8CObNNtywb6fvInBTISt068dP6gl3PF
 i/sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt8wPl0GLCZ9xNpqQmyGAr2XzlIO0Qcsd90a+rHyKM+uLlyY48uQV244qpH7Ca01BTZMx9JmvETIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8gPAnswXPssqWmmHJ+kXaQTXaK80o2z9RjIzozh9RClWY+7qL
 4DYLYVvur40alDOX0OfMZZyh4Xba2+2VS4xeA64xwu+zhhEDkfsPjTpPNVOvY3HkHAInRZkIaxa
 jkA0h3EidtAjqxeOp7ue3MV+CPgQVBNLU+eeRVcLM5We93ArBZ7n2YJTPYKxM8QyBfQEhsOg=
X-Gm-Gg: ATEYQzxKqBUurVXtUxDI+bkKUNcn9BIImBZBwEfxbfWh+uZUCLMu3r7SDA2xcip3Y6M
 zSsaw4jCIhiAdVTJVMBhTLJK3tvOB5rlW7hBSvwG7K+Ur5IMmWXTzIRg19XxXJq/C8PdXZCY3pD
 fY7mDWprIoC2/k9mC+6wAyIwA+2cAjg3nhr+G1k3fZ/zDZsREBwbw9Zouu0oCjrPa5yHYFueBVp
 bLoCw4uO2DOcwGQ43Cf0kkQloeTMRb0WHBkCwn3uP8PPHSZfDDXhWRsGloYkydGM4Ngi7XnJ/wO
 PsbGvwRNNbjZrPh0jcsPGb3I/Dn8qur1Ium/0RrnI4K0CrKPPx2qYHueONT8ztn8bioG00lATt/
 9r4uCEVUtFxSK92Q/bQSPewfDtNrmr2NOldn1
X-Received: by 2002:a05:620a:2956:b0:8c7:fdc:e872 with SMTP id
 af79cd13be357-8cbc8d9e73cmr490767185a.19.1772217293689; 
 Fri, 27 Feb 2026 10:34:53 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:8c7:fdc:e872 with SMTP id
 af79cd13be357-8cbc8d9e73cmr490763085a.19.1772217293092; 
 Fri, 27 Feb 2026 10:34:53 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7507adsm256624345e9.9.2026.02.27.10.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:34:52 -0800 (PST)
Date: Fri, 27 Feb 2026 20:34:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: display: msm: Fix reg ranges and clocks on
 Glymur
Message-ID: <w6rgjozkbhvjbhoiv37ib6hs3ydqnf3zz7app6pziggxitpuo3@3nfmtfqr4ui3>
References: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
 <177221144530.237949.10314173375793939491.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177221144530.237949.10314173375793939491.robh@kernel.org>
X-Proofpoint-GUID: yl_ljELPuUSaGS9B3Xoq5kXmpSQ9F3OL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXw7nBt5sbZ1ty
 DxWaU6BlBAfbxP0xeXj1lPsBLdBYc9igtvkOrgCE1jUc9zAYKU08003qbpL1dxp7Jxx/85NrC1s
 5CXsP9ScG+coqUilERNF1YJtr/ktzDjgxD4N2zpU7rszbnkw3fBSppaC7DviBO4hB/rETjWoVgx
 XNAeAJuysT3lyA7ali+UczUkx+KjCvbFI6Gj14B1/lS5RDw28WRMIJhkSBMfqXCuPzQLHgC6VxK
 stUimWQVtGwmPeUMTovjtdjzgVbDup96LdLa2OBL+Sq+zKwSFmab+TlmDa286P9wo8Y+1XbcBN+
 obBFVvTxDkHVqjPrH5OKX4O6pJ2zIThbCxn1mlrd2DAAB+9i/CUCqgVKIzVi27s8DNfQNALNeV8
 b4f6eSexGUDc7X1Ygd0ACvpbm3Qn9AIoHCQitFGXpBI9jwX4w/DtPgBa2XO8EgPhBKft/ORvcxB
 wyiT1Php4d/HOwD7CsA==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1e3ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: yl_ljELPuUSaGS9B3Xoq5kXmpSQ9F3OL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:airlied@gmail.com,m:devicetree@vger.kernel.org,m:marijn.suijten@somainline.org,m:krzk@kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jesszhan0024@gmail.com,m:quic_khsieh@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:mripard@kernel.org,m:dri-devel@lists.freedesktop.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:robin.clark@oss.qualcomm.com,m:abelvesa@kernel.org,m:tzimmermann@suse.de,m:sean@poorly.run,m:linux-arm-msm@vger.kernel.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,somainline.org,kernel.org,quicinc.com,oss.qualcomm.com,linux.dev,suse.de,poorly.run,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,devicetree.org:url]
X-Rspamd-Queue-Id: A55101BC05F
X-Rspamd-Action: no action

On 26-02-27 10:57:25, Rob Herring (Arm) wrote:
> 
> On Fri, 27 Feb 2026 16:23:00 +0200, Abel Vesa wrote:
> > The Glymur platform has four DisplayPort controllers. All the
> > controllers support four streams (MST). However, the first three only
> > have two streams wired up physically to the display subsystem, while the
> > fourth controller has only one stream (SST).
> > 
> > So add a dedicated clause for Glymur compatible to enforce reg ranges to
> > describing all four streams while allowing either one pixel clock, for the
> > third DP controller, or two pixel clocks, for the rest of them.
> > 
> > Cc: stable@vger.kernel.org # v6.19
> > Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[183042048, 512], [183042560, 512], [183043072, 1536], [183046144, 1024], [183047168, 1024]] is too short
> 	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

Yep, I need to fix the qcom,glymur-mdss.yaml as well. Will do in v2.
