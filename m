Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ1ZBV/inGnCLwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:27:27 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00717F625
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 00:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BC710E464;
	Mon, 23 Feb 2026 23:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXJ/POPd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FusYARh7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E9410E464
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:27:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NN9tCt185581
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XQMEE4zQDEJWXbhbQn8aEjbq
 vTWxQ1D/g14nBRE8bsk=; b=VXJ/POPd6hE4A4AYfEC9N1zWw6mldcdQkJ3YSIQe
 jd2t+tW/G8JUPk9M2UZoUmSJKUhPOvsy/w1u69fz5f/9zkQbyTeliHkMHkBoQQN0
 o6FktEKjEcWNPiP5QhvnLzqkpqSb1S57LQPV3HLjNQiYJD1YasCGfKzxYCh0ULiK
 TJQRXhzwsZMwLGUdBHKIagRv1kADW0nNFdrzsSle93jGxwP+LScVn7Ikpvjbhyqw
 KNqSIBx2RhGiPvkrUyesnsLNUwdoLF0Dv0gkEKhw5Ez4fARUxY7efJGiepUC1bdC
 irJEeBoLGeTM1mNnSSbAZWv8UM9noAf0gOsJe8tQI90a7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69hmn2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 23:27:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4d191ef1so710008785a.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 15:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771889242; x=1772494042;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XQMEE4zQDEJWXbhbQn8aEjbqvTWxQ1D/g14nBRE8bsk=;
 b=FusYARh7sMloUUTH/4TsqmEqMAtF1GHEfuCottT2as8qqoypJhMmfWvmNG1KcUSSiM
 PW+SzhiSJZtsiMvKnRRK8P3QvHlmpxcSc6KnXhqXdwgPLcZMtzn80u78ytM9Cuf73+k6
 u++5X8ggSRulKgSFDAwK9ut5ePoXJ50NQehx2gfsgcRpWnk79wn5e2fLxyi9wNpnhFwG
 yE2GUB10vESJQCvj1T2YPZ8DH4/FUQcRC1q09LW+2gd/yqcxsYQr94LURUCECfm1m+Mr
 Iweq3aYmyUhybk8zhA8CCfjygCCvaTSsill7eaJBwH2RhvASVhPTo4wyYap83IBS06JY
 O2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771889242; x=1772494042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQMEE4zQDEJWXbhbQn8aEjbqvTWxQ1D/g14nBRE8bsk=;
 b=hhmlIcFkpeCgSaGY8YOBRQOJb/sWBJ19j3qBOOLJYsMl7knUUFp7gao1gJEVew+Sy0
 vek1umD1sS1wd3ZCpiDmByJf41wVlG+WLoNrSUD0AvtRih9UX92l/vRyllrgy8OZdas3
 UD0L7NIFYsduiywC+63wpFq1L59w5OOwbfmreSkioBBaxCSu79zgwtzpf2WbxxWA14Uh
 CJuf26jrefTF3CpAZE8fXyJRqvlTI/4Qwvic7VtffqkRLm/+3Les9/uxM+Pg7Ynn8w5n
 btjgH6uKs/zt1b6sGp2AgJGw0YCCLR7nkv6bw8pcnwo+bNl7Cmq5ziVdCPegPcL4iGVq
 TGuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWcYYRjE1mlIiDk7qpBeqePCoxeDD2j/meDrdV+UMd46IahB7SCxtluSfu+fIPLUriyVkSlXgpgxM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2WzPk/bgjAGgtm8djEok9p3fklKZGrZYEAZCaCdp0dPulH3vH
 bDXZO2n1TxyyOxzZJ2gonfsx2ZhtXEPma6nueLLKfYTOyrNqK4N0P7yvrqYCGeS/WgvmW6rXNvD
 9bpehM/mAkyl+cFlq5tiadVHOegsuBlqa9NjmFn8rf1CHipq7tJGxtdkauSZ+68C0FhbAi3o=
X-Gm-Gg: AZuq6aLT00G0uKiFazyhRA4cw2c5asYuFDPvWRIxC2FbFMzw9BXe8e9+hXT8sYlTtul
 7KmWiXXrV2ldMi0oXTP1hC32BBNc+44ZmzSJ9ZaCdQKd1D+1ihZ4nP/IPJ5kY2FckzWbHxKqJaM
 jcxtlFyf6NlEK7yXkSIlA79z1bWa33iIcnJ0v97oy1SCFbSuJLDeYg9oXnNMMJLwza22lAKYrAN
 GjOyqUfqzMSkPAEzaU9i0NItzDEoMPvGzwSr8Dm9am6bjsKUn04Gt7m1UYfJ/sVJpWNcmlzODAQ
 5mPd/arW3zJlSDgLebVONczG/s4GW9ARTCjbbw5UeF2mMVNFkQFcaR+ZeVDIvhaY8t16o3ECTEA
 +SwTwPt3UEZdhqauxQ3abhttNYBcWB1kbLmgy1tUaKc6Fj++pXHPVX2le7HfrABIMltF20jnrGw
 m17WUCkJbdRmkWiQ3yTumIN6wJcjtqL6I+qZU=
X-Received: by 2002:a05:620a:4445:b0:8c9:e989:9d97 with SMTP id
 af79cd13be357-8cb8ca834c7mr1325878885a.68.1771889241197; 
 Mon, 23 Feb 2026 15:27:21 -0800 (PST)
X-Received: by 2002:a05:620a:4445:b0:8c9:e989:9d97 with SMTP id
 af79cd13be357-8cb8ca834c7mr1325876885a.68.1771889240668; 
 Mon, 23 Feb 2026 15:27:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7a71271sm19006771fa.31.2026.02.23.15.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:27:19 -0800 (PST)
Date: Tue, 24 Feb 2026 01:27:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <bn6v3tfwj4s3ymfzbulo65qhnq5psfgjwfqaqmhxxuli6yj4mt@ugalqwbx5hhx>
References: <20260130053615.24886-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699ce25a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=y2YDxqopTWoFPjg0B8cA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ufXwyq6bdSVhCw5CJhyqpz8Z3JvrdroS
X-Proofpoint-GUID: ufXwyq6bdSVhCw5CJhyqpz8Z3JvrdroS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNCBTYWx0ZWRfXx04lzZKlUzYn
 TVkOcJJw0niTrIV2BBMPp3YcbQ4Ks1pQSlU4mPD9m9fsJp/nsroTKgBcCE7zccJzpv0l7pfdfVS
 /SRGVuV/sgVqEGBizYBJgYTXn8AU0IHMtvlP3C9I8zrLv3klOz5s2LYHKKZgZ2Eegb6wSxoXeA7
 p4TJFr/672oqKAoKhtbLdV7FuvH/VMhC0rjYlHMlPrMAcRCtL71pcFQCRCVWaFewWxnHZiuq4hn
 b+rmQKyXSxk952zZkdYNSrsPXkxbXAFguUNkoe6A9QjteDznjsyWe/mX4np92QLZhdBG0Yx5KqU
 4xXL6pJSlpbvH1jenMC2PJSgWEiH8vZvLNF5jZafFulDX4Q0BMCEix3VVSRFkEvo3UDaX54urdS
 cH4VUIbKUEwsUTeuzhVAgoJQGjYAu26zCmsc4d00hKuyeA3Up3MmRrsKbcEKOLeY7ppIiYpxjsf
 8xK1GeeHDaIsL1qUETw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230204
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linux.dev:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,kylinos.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5E00717F625
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:36:15PM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
> v2: Fix error code
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
