Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIr4KKSoeGl9rwEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 12:59:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765F93EF6
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 12:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F6610E553;
	Tue, 27 Jan 2026 11:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVNhGpNr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEuNZMA4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD3A10E553
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAhnWu3714713
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Eo3XBVAezIW+Pl/mv1qSYsEu
 Y0LGy16QnUk9fgbCnfE=; b=fVNhGpNrT6yoHjf0HMpLShURopOlMc1CbPZpLkDF
 249mO6SYCMjBk0/fz0C2lV0d1nENDDVwDn9bJHpwqLf9B9qzW5PiVfq8dglV8ybk
 MEyqQvpc+H243PHUfm+zMRVNhfPd8PMb3dLitrXy6wQhThipQOjB1DkJPm2LFLqs
 ZSay4NePjEaiLsoO2Vt7ZoObkphLWuDYl7CDx7P7c3NWhFjTkdaqDzo2OhGhdiTP
 pkl+o9AqJqexsmFEgaPyK9lkqk4U+cfXVMGjMADzoERW4FgG3TALTNwiyWvYpkln
 5+zC0UDL4DdzyXAFNtoglXjHlxIkYKAavGzBHB7yvXyn9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0av8c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a7fb4421so1411863385a.3
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 03:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769515168; x=1770119968;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eo3XBVAezIW+Pl/mv1qSYsEuY0LGy16QnUk9fgbCnfE=;
 b=cEuNZMA4W9H3XIcE8n4F2Hp+EYF1AIFjejpWffJZTvd12RlMP/g1IQVlj/sogP3oH5
 PQKOlcMVIq907TJVoHjclt4qx51hSob8gTdURuBqraSQSpTAcHFu5s/a5TxUKvpkxniH
 4dv6PGilW5vlwsELeE22aW06OuBDnj7a27rkxLfmZBwqacW7cLraXhnT3HMz2GWNEj5i
 B2//l07sDXKAdhs3BQ+BuYjAVv9NM3Yd+dulPUzjkxwKmcweffYUwFuEya6/D8ao6x/V
 vkOTUj3zWIgcQeFP23isMdwKHGvWI+tjMsZkd1T3PX6DJzQzAgx+30/Fz1rSyUEqsLLP
 gR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769515168; x=1770119968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eo3XBVAezIW+Pl/mv1qSYsEuY0LGy16QnUk9fgbCnfE=;
 b=iAIN9ScMn4TR75UsGFRk45awTl7vU6PKBOerq1lmDQb8uB5N/1mIF1IBVWx2V4RHp0
 5UFKyAYW8vJa5CsqGOkFk5rtEWGwCnyxbM9/hu/tgFp0QA9K86NmuYSZjVbZL0bvCWHa
 8DvAbForwVQ85K5mvqsVTMamyxMwcmjONi4y21qjXL/Ad1lGXnNPVYAPjAKabeiWtBJU
 GDY7CRsVz3WNm8CqoUO9/dwm/SVU/RZbHfZRdWA7nWoSUazKRFiZ+S0Pe8pvup5x39jH
 lF5+reb0JdOTPbXUSGjscky9urDMjYPRDzVLADhqGYGWvhIgr9kqNyyWY7kifddmheAn
 JuAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrhEssTVWHzmUCCjj4yK+ku+VReeNlVSIGM22taRIIhedKJtvYZrk+JP6MyR9GsTN0Py1pReGJRFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRmxMXEG5EUpF+Mz2WXAlbf98fMGA8/b7JZDIolmvvNA/A6GZ4
 VkxqbaAQ36yl1HZ0u6i2N/PgUyeOv0XSbstBABeHrQHNUWIuP9X0+2GLfW03mg8Xfa7lbh9ka6J
 L3zv5eAz/0O83L9l1Ebr5Pek2nyt5dmvU6nAbNADq9A2+ImaHRqUS0pMPeXTma4D/jYGTwnU=
X-Gm-Gg: AZuq6aIu/4CYJs+DpAs9nCTfGhWbH8G+02Mya3Jevr7qPoBxDWXnTiqyezGqSuCAX0S
 qdUcrluirymXgCt21nRyfJgI+X+tNRAW7mcd13ryeoNPBMEctq4giBLeDrCdBj/G/Hp9W4ZYrEs
 dqbj7AciXbA90wLGfOO0ZESzkdz/bGCo8aUyhF0kNJu5MVeEdd1dfvLukaorMmgeO4wzXgHJqIQ
 S9/Pr7Wgj7WBznH1Y9Z7Jj7cBcX7pqVQ9KXDiXeOHUwCfYXUUExHcK6nUQBqqXU2GggrqBi/AqF
 aKR72kS5vVPQL8//5psDpdbAyDtyC85k9BkcU8aMyAttrE03y8strIixyweanvdSSaB9aRd/6IT
 Ryf/DMZ0eGEmU8HGhcAbmrjMRNB80J5rl5w9XYLINaeAeN5pF633KBmWWvL41kska9An9ulLgjp
 3qiAidw09wFqDh4KsxHqDeeO4=
X-Received: by 2002:a05:620a:370a:b0:8a2:ee8:e7cc with SMTP id
 af79cd13be357-8c70b8411a5mr147107485a.5.1769515168453; 
 Tue, 27 Jan 2026 03:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8a2:ee8:e7cc with SMTP id
 af79cd13be357-8c70b8411a5mr147105785a.5.1769515167989; 
 Tue, 27 Jan 2026 03:59:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da1705f7sm31844261fa.26.2026.01.27.03.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:59:27 -0800 (PST)
Date: Tue, 27 Jan 2026 13:59:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <5sb4agmjs2xemn6m4zetab6qvf2xatwkkwesayywvm4zx76bt3@4myarlti3jku>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-Proofpoint-GUID: XGabwa6Cd7ZqN6lrcUhkdPeQnU1zJPB-
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978a8a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4POtUoziGYp5d_2QLlgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XGabwa6Cd7ZqN6lrcUhkdPeQnU1zJPB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfXzwKp/6A9jLza
 RchxGNvvdyUJu80f2auzOl0CaYfsn3+hGZXilOyV8igyQpzD5BlOXLHK0fKkvTlQnZ0eLWsNUMZ
 n8fD0Bv20oA5FHYGOFFJ3wWMWfrQcyHnAc15AD4YxpGkNKSC+kBZbiudQrx6UWaNjxjKKxAf0Nn
 YGYIiYo3Q9XTKxbu5ixTX9qq4FIUQ4SLvZmRNcx3T4YhO2d2VijKjD9nzOqR09Hy2v4/MqkN/c2
 oLhi0hd6FwJaW8wgxuQPudEwL9yKAgFA5wodnTdBtSUAg3sXI+jAJZJEqfrhRSdXSVUMh2/KtE3
 E/85FHt0SMUdsfNmJQr4DGsDCZKEJoeNHTut+ex3aWdt/9SrWDlqTA0Cva5E9gM4WGLRlaqefwi
 lnxLoHXytHLDS+RMBiT889thD932L7lGVps7kAHm1io7d5HAtmvmn9U6I+9hlCxbHxm4/3ECpzN
 fh2i4aFO7pTAT7iAVfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270098
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
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1765F93EF6
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:58:49AM +0100, Konrad Dybcio wrote:
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
> ---
> compile-tested only
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
>  5 files changed, 30 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
