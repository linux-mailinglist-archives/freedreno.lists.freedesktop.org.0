Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLPcNLzrdGng+wAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 16:56:44 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530467E117
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 16:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2275610E172;
	Sat, 24 Jan 2026 15:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SG12+DI5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsraFdxm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE12610E172
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60ODsNJn1567013
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PD/+4Tv/QlJ9os4hleObvuo3
 vPxWZDiHtIkn/geyQaY=; b=SG12+DI58KAP2XZnxvPaJA5caCKX6CGBs0GGHypy
 gpMNt3t0b2LoKHoRk4vDdS8d6HWSOQn4/NuSv8SMra7Zo53M7J3RI59C30oEC6Xr
 S7/j6X/2H3oZXhe9Yuk+ByDRU+gmXdFKdWX7TPEGinuhye36PIro5lzwhEzu4yJg
 IddLiD/jh8rqIXEg/JwbAl0jZiqZxCZVD4MnGxWgCeDOx2sclhNSexoNTtj6Ce6/
 /SNTtCJPLgEOgOyaNn4VuukzrJrdaGCMiFDEzjpyFocZgzoX5oP5V+C/WYmh1nGg
 +7iR4ZwkNncGzJj9jC8j1AKmgQnNn1pKn2SwM3xk4IIbrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3h8udm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50147745917so140992231cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 07:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769270200; x=1769875000;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PD/+4Tv/QlJ9os4hleObvuo3vPxWZDiHtIkn/geyQaY=;
 b=IsraFdxmcXCSjd/7ROStFWS6MwrWQgx5UVCC76d6KxhLKKLyzUp2ygf4EvvpHWMuzi
 oKCt1/5diZQswFeunQ8O9MtdJRFJ4cVjPMAv5kZUQqL4kkRilZEZ3FaBysELz3DPz9bD
 L5iR6jz6KiOd5x7Zr2/4KOM+lqlBIitmiY673UqqvUiXRS8hZgtoRN+KDfoD5i8w49Lg
 NdVKKLrjFcm8xTn7vRdIzmrsv7J8WtMXirflLwn73VyDPEOXanBbFRkxkOQD28MpaoC8
 cPpgPAqDMpoaekmtai4D22hwNwzD0N1k36+s4L5XCxXdmfum/CAEm0QrX9qECehg9/9s
 DZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769270200; x=1769875000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PD/+4Tv/QlJ9os4hleObvuo3vPxWZDiHtIkn/geyQaY=;
 b=YAMQZQnhpb+11JWuK6Uv6IrugXMlrMNXyTlOwC4TQwuTvAdmiBddJ/u+YI8EQIHo4z
 7YGnRQCGUrVZPbTxwwn4KFbmUC+kKNn2tmEo5sRNE3KyDanuRZSPdeM36Z3BmKaf7Sca
 IKmrvUEMh+KdgXuv3ZTG5SKaQ9L4mTr6ZKJrzZvLrbq4Coqcx41QGKPR8dxRAIoFrWa0
 LHG/acHbzvcPpkUuIqdBGEXB1glTukWdPvKTkpaMJx5tng/WuLVmQaSUqLlgadjkq16+
 5LrGo4DLPGXs7jvMphzs/UeaBmi2uDBzcWSCP+MjkA90dDChBjhWZZX1KXOLoMZOx9vc
 7gIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIVQCYOLISFDZR54lQfrsURotiM+584w5iYWvOKrjA9TlFE+B9igC3ft4Zyp6ujym6cm9m+jFHr7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBQmmKgubswapEmS6VMV8UiPVz6RlLFeb5jsmtoTlrikG4e0Ls
 fXibJpNgdUYO9/8qH6H9m+Tk27ICdgUN/r5NQyFlmZrhJ43xEL6YaVRUa3jYzXSVfFjcdZNxxig
 6k7gQl52G0iyairZKYQw3SgLkBvXp0h2LKkcAlTOrQsTrN99C03zey+7X5CPR3qMjrVr3wtY=
X-Gm-Gg: AZuq6aLjOsMhO9VwjxXPH0pjpRlRPXOh0jSROLGcS1Y0YbgTdvaW7iIMMREHTrPhlqx
 d9FiuvXfV8oRbchyFdmZCxA4QkPNUKY2mJ0eCQC2lQ4XqXcsztAfK6sysIUEqrjdMaS0J47cyPH
 JHN5i/PmEYG5WAjM2yLmDKtYW+gIqBYO9m4LdqMaspGqaeZCbEFAe0FAuODt7dVBqqoj59mZkjL
 OKYuK6aQw6E+G9+X+XA+OL2u27c/HYJHHub9mHEOeVXlOm3ejm906E8zu70UgQIgdr3TXRn5SM2
 5zq6RLYJzd3AtP8Inh3sEbb/yyJNCY+eGUc8NeAKAX2vc2BqVXOQ/WnuS2mtoxEWcFPmJiW3NYW
 rIqit+OcJEMZ98OSpGqvh9zv3S4l+ApC9/MFeGFrobmKVV8IJJrtszCE8Hl81kwZJ6lSrnIIVga
 i/2Mu5t6kRnGHnTfE6dmhOxag=
X-Received: by 2002:a05:620a:6c86:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c6e2e34264mr811833885a.45.1769270200306; 
 Sat, 24 Jan 2026 07:56:40 -0800 (PST)
X-Received: by 2002:a05:620a:6c86:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c6e2e34264mr811830185a.45.1769270199769; 
 Sat, 24 Jan 2026 07:56:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da200503sm12996901fa.50.2026.01.24.07.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:56:39 -0800 (PST)
Date: Sat, 24 Jan 2026 17:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Message-ID: <ai2yoizqkpx5f6n4y3v7p6im7wy4xwsgstpj3z2sbludaat5wv@i6gpuqwg73yi>
References: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDEyOCBTYWx0ZWRfX1nzrQoOCNt36
 sIkC5zVgNutIsZzxGQMZlRQIordrlq9thJNbalBrLEDYO2Q94dhfsBYcq0GYzRwm4ko1kF0VYaN
 IGid3VtmbW0ue2eIw2yj6lfL746yLYAVkMduTK1lBQQnjVzjoBqZ2g/fJc9l/sdP15+ttC/dhuq
 3il8W+ZYAOTq63s1jH16lNS1B2RCn7hXAye7sOLeAVt4ajvC4VgyMiUQqxFyHsO0CfrOhFK8tlA
 T/QJyXoGexHrp9i03mTA4RAkkFU8oOtpGFLqXz1/AR9qqSogj48bt0SSNgT5yOJVtzP6sUzX7Zi
 rLFOQSuGnr2MB16z19R66/jaTAKomlFVMK9XBUCyxpw3Hsw706jXvHlHDKhGcyde2beKiMj1A6+
 TwJ0z7qbzqPTgAXM6SYzvB8wXbOtng+eBP3Q6iStexHnzmTx9u6e3Pg/vq7z2yrkEiqAfwMMm9A
 ZeJN3jsWvISL60xinGA==
X-Proofpoint-ORIG-GUID: hV7bwf-8FQrs4roqGDICnEHgu1L7BmU6
X-Proofpoint-GUID: hV7bwf-8FQrs4roqGDICnEHgu1L7BmU6
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6974ebb8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YWtLmMpjZNbrRuJAT3gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240128
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 530467E117
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 06:32:56AM +0530, Akhil P Oommen wrote:
> Since it is possible to independently probe Adreno GPU, add GPU match
> table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
