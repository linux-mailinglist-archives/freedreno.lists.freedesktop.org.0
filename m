Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDLSB5yleGnVrgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 12:46:36 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71C93D56
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 12:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F48B10E084;
	Tue, 27 Jan 2026 11:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+Mx0Mw8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrHDUOlJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0EF10E084
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAnqne700163
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MLtuoc2Wd0WuVPEXaciWpMVg
 21wsMqAZRvFbNmrGRnQ=; b=e+Mx0Mw8732J/82KQSPd77PlMhXxv6LteNKSLKCZ
 EPN+hKnhzRqr11bZMm7/aqoVvLBoLlWtHRtBSAXPujK6GcwQFqwpq8lWFfnGIKBv
 Om+P77mSkVxHJCuYaGIbc2tFmWO2W9LPA7dPWjP5LW+PU/fDYLwrd1klMH9EjcqH
 MprOVi9m9Ahk/uxUFmZSFcqE7mZkoNukeAExj+WGWbz/DHDcqxMOJwE7myQA68BE
 IGBIk1Uyuz2+4/aRT8iPjHmgiacADzB7AtHbG3Towqskz2jdDYeu56+kmHV+Lb3f
 Gkd+LQ3BX1hRZMsmwMQ1hwvboNuTrBtzm9c7rDjx2adbsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3tmv4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a7fb4421so1408827685a.3
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 03:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769514392; x=1770119192;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MLtuoc2Wd0WuVPEXaciWpMVg21wsMqAZRvFbNmrGRnQ=;
 b=XrHDUOlJXy92DDRpBGaEMsP5l860dz99pqcxmAvuwWE5Om0fm4j3sxbdtMve2jUUpY
 nhWFmdvtq+PwLKnoKseQjPwFqYJQ/9ulYrHFl5VClbLhIxUiRIB6VMhCLsT1X+ZLiuha
 h+g+45va7g7S7mzCDEdVgF7WvGEDv5kVFWl5wNaSC7N/kHiYPNjk6NJgfF9m7FSGCFfZ
 cWibCGpmHHNtgkCHz0CVz5IlqQAxOkm6j2MjEyC5iZpZE0v2JzF9iO9aPgnHraRiGFgQ
 1k4QI3KftJ6FeSAXtDa4EXO7DQsJ3JE6YzS6qr5d0bbOTi8V7jS1LRu+W0wf+kkMESeS
 CP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769514392; x=1770119192;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLtuoc2Wd0WuVPEXaciWpMVg21wsMqAZRvFbNmrGRnQ=;
 b=Pt1t8aKRESUeyZWbgT5niMfpIDzymIF8zowvkp4kn4dLpq8ggDVnpxEpqHjb8wc7F/
 RRX9UUbKUI5+9q10LLa3qpUU9rJ3L/o2UpfX7dd3NHfyAgiC4RK75wLeSbyDwa9YM5yv
 nHPsyoREUxiuvj8p9lwzMKnnWnhV/KSk+UBjKS04/A3JC4clkSefNF1WZBJt3UjZ7ILP
 ZLEv0MgQHUt+ItlPXn/J1IB2Tl2Xqrhpb23xq7dgsRzLI/mmOpeFhKGDJgGQY6DGSFhV
 ED2DtLv0q1C075UBY+g5HgKqw9yukZcW9KrngrM9o7Nkb+v4xFZVgb6lOrM4lMyL4dRV
 bTww==
X-Forwarded-Encrypted: i=1;
 AJvYcCULBpxF+DKOcw0ocxK20h2eyzX7mc6mdGu4Ewmnm35uwRDvykoQJWjGiLJLxZYCckKHjaTr8zZIQZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5gHBKm7cBJBvOaB11Nc5HdoIjo4JOX+W1xJL34ifWV4g49Bc5
 72aGbXsw6WsH97UULHq95HMfrLYFHXQtTiyFyRF4pj82JEEssnw4HZx8NR2RnAHAQF3/WnOYAQB
 8R7ANE+/4p42ykM/xgUaBiwImjq2adQ8Y9ePWK4pYV9UnQzTjlp96XhqipUaN+KtLr191Eys=
X-Gm-Gg: AZuq6aIkvSD6MMJYItnhsFq0C5ktJ0Ejd82v6HoPAUgcccIzIiTOXFp2nITTdfRKZGJ
 0G14fe38zQeTEQsf4Y/VtI6T+YxU2AvQlA/yzRz0WE0axrvCGD19YCHAShFeGT8km9sv6PLHEia
 fCvrOWteaoxpQ2U52FUcWsvAgGa6tSpmRoIY2UXDwvV4X43LuQLKsSTs3fBvs2wd5LnEkbWTo9e
 Ig36uMldnB2v50ViT4stDXQnQz0FBkRa+eThy2HLYgGY6PAyAXldtTx+u/fCqI44Na/onrFIL1z
 sPZMo1kxVfAaZIygoF0kAubHNoZXSHyuiYUPluFcdQIuMYCCQXVdoCItliy2nNVksIWU7zSD7jk
 N8rygjI4bnuvT711mw+BQk78g
X-Received: by 2002:a05:620a:1a95:b0:8c5:310d:3b2d with SMTP id
 af79cd13be357-8c70b874091mr156258885a.33.1769514391648; 
 Tue, 27 Jan 2026 03:46:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a95:b0:8c5:310d:3b2d with SMTP id
 af79cd13be357-8c70b874091mr156253985a.33.1769514391021; 
 Tue, 27 Jan 2026 03:46:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24bedsm36091323f8f.17.2026.01.27.03.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:46:30 -0800 (PST)
Date: Tue, 27 Jan 2026 13:46:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Message-ID: <h37gfvfbla2uk6sxzh6zhi5uotqhjarsqqrubhx2odpwwxmwb3@iagedhb4kgu3>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: r8UqwWqWfcG1jAYStHYhH_4yleK-zos8
X-Proofpoint-GUID: r8UqwWqWfcG1jAYStHYhH_4yleK-zos8
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978a598 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LCUY55zAO45cASmWvjAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfXwbDIRxVFLqlw
 m2JV2Sreem/7Cp5olByOqihnxu7kNLkAKxS3iHuHgDNlhH/T7N/1p4fxutHOWPSwL2nIZqFb0s+
 Qa3e96wET3VjASUElpV6+fB3uUYfNkiieWJzWFAl1R088Sn7TN6zYdc5xABViAc7bTmNHeN9g+t
 kH+DbKUmVKTTzmdcwjEHX5iFoKXD2vhAtE0h9CyJHOR1ExbRDFMr+Uejzg1tabRaxPTMDPErPU7
 9OYvZkJ0LDtF7gjQ49aqve3tXSyVAL/mk6haXDWAgQDu4h7DEIvh/PrqsUGCoC5qA+75ECCjkoI
 /V3Rw5i6p2LFrj+/wfq+z1qPWSBT8uFcGGsm1jK0K7QxFHUIlCGaOx+89VSAJWeSIaq3tBKZWRa
 wao2cU4DsKaHtK95dFd6fi10D1enIiszG6CWKemum4znIS2K8UNTFpOH6tOWrrJC+UoJPUlUphc
 nhYWOmcEf4s0cpDYoIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abelvesa@kernel.org,m:andersson@kernel.org,m:quic_khsieh@quicinc.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7E71C93D56
X-Rspamd-Action: no action

On 26-01-27 11:58:49, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The register space has grown with what seems to be DPU8.
> Bump up the .len to match.
> 
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Quite straightforward, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
