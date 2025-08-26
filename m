Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCF0B358F5
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 11:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9D210E61D;
	Tue, 26 Aug 2025 09:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtYTmx7o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE910E61D
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:32:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8kJTQ020022
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yw7Fk6HJCJShlv2t9i0lzWI2
 sWKEgdH07td1ipZYTIs=; b=TtYTmx7oQltxw6Oc38y1ihdCLJNaDUO/XHkY7JlG
 iPA1iHeugl7VmWmaaonhvIPPK9qZhmH3WI8oZAfLk6S73i8tvYZMWCV7mW7fC20q
 IaQeEGyhU3G1TQL5c2DbLUz7AZBanjz1Np68EEFeS0eFhGg8xdw1GYTGR2umic8y
 1G6HQ3PHk5H7Cs7dQ3v7/oeu0ykQ3XwpRNspfepw1o7mEx4AfjkWALD8xJjhB0Be
 1GTW83bNMF8D6S9K8uYTymXR2Er1WkB6zGBiTEME2wLXtGn2wgrD86vftJh9rElT
 0pM1wD25Bi916ScgX4hSJm8Z5bNOk594j6DhyimubANMSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615g5vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 09:32:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109ab1e1dso215117831cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 02:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756200761; x=1756805561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yw7Fk6HJCJShlv2t9i0lzWI2sWKEgdH07td1ipZYTIs=;
 b=KtwnDGChGUpzDVAAAp6SYibX9lHFahY/jkC/HeI8RJUajLGgHFx866XxshsuzW55jg
 lVsQo6Co6xF04Gij7/VK8rEzz9kKTUB2I3KmzlyWNjWfKllm0LbDLVOkpXgLwcDhCyWr
 gyelzB73xUustENI7U5a8US7NFaJYIbSWU0KGImCmvWFE8s+AopK6ijj7YzqCZUrpt9L
 pWofIqAN3JffU0dyXD8n75dSZaYyNB71MdDzOKlH/vyRfR2D/5nvkD+DTlMIFDsvg48i
 bJ331B2vbvMz9QWrocoX7y09wb27okwIj7ytSM+pMj95PvPYlOzAiayFjxkTqbpPSe6m
 nwLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP0C9tx/W6den2jSUYTpCGa5NgqkoBXVv9LOFNcegU+j/aDhkduDrws2skSCcnNMPZATzRyNvAMaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Q1TLHBN4qlwkOjL62MdW/KDCjPL/SdW3E3amJXoP3tiGtvwf
 20NCrkl4JpQS4EkdYK0kyN0Sh4ifBHyx5tlu9sL2tQ7ip5QJlWWvhZyRRQFeEOiLJCVq1PSeifG
 L6Xu9Hc/S23oV+GEArCBSGmblT/8o0iPha1+sJxBsGDCMWSFEDLujySLnIvxvnEU27q9sfz4=
X-Gm-Gg: ASbGncsxowlFH1OAe//x2PHAITqHu6NNob4WslzwHw/nUJRE1iUbtc3zcM5zyW731ed
 qa27t6FSkwENLTfh1QMtLzo5VkOUoFYebc12ss9tyB1L4UOQLLhxtRHASOASv7yOq5iPn4B+p2S
 +tnLayoQopM+/EDSg8ED0hHvgLV5C/amOqJln7syDUvcvbBed+XuFHxvsnwg0pW8df/etzqCSjz
 FXMAy+5FqVxQd42dKC1FxijmkfrZsoEIgKaObk4OF4dpkhrsgcAUbd2mj7MfpmT4Isb5piMGtAR
 rMki2IBu0KRNsrybj9l3PIhe+VUlW6VGkCShHlXGe/hvq6eCW4t8E1cU92CgrcREEY6JQdQgn8w
 4EY7rwWJsAuDXH/x5o/+nr6uvoz3U93WWsmQOVmlCs5HHCjfRWuIl
X-Received: by 2002:a05:622a:544d:b0:4b1:c29:22d9 with SMTP id
 d75a77b69052e-4b2aab66b5emr196220601cf.58.1756200760505; 
 Tue, 26 Aug 2025 02:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Pd9IGXO+XQ9K5LfqZoyJqKQgbNRBf/lZhXlh2ogmR33qnivK3QzAsXMGZxpxVrpfTu0QvQ==
X-Received: by 2002:a05:622a:544d:b0:4b1:c29:22d9 with SMTP id
 d75a77b69052e-4b2aab66b5emr196220251cf.58.1756200759935; 
 Tue, 26 Aug 2025 02:32:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c9a1efsm2142240e87.118.2025.08.26.02.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:32:39 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:32:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix incorrect type for ret
Message-ID: <m22aqeeviic76y5dgo6xgvlc6y3nl6xa34gnznp66g4exkgtce@eu2ta774tekb>
References: <20250826092047.224341-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX605gQmV4s0rH
 cgC0vKqakhMirenY34l2LDVOjrorcVQLYu3fDoKkupWTbReWW5ovjLWOyGl6nnmWQKVkQCMI1i4
 sGJiqBkSqEykWvGoXzvsLJZ0v16tyi9D9xOFSqJWJXDhbCqidqRtAbhFc6A2zlEeDB0ts7dGX8T
 g+c+MuMa5YjbWWIkvxbYHk4/FqjEPxHO4ntFBqRHmkIVVF2QZ1zXBv2SLnFBT5FjRhktJM6MMgI
 nxMOTE8L1VKKIDpf1/pPoUsrUZpMf0KGaDSaFAwe2HIqgauxzUe0wfxdgzbgrLOCrN27qN+9BQu
 m7ie9WRT+CkiXzNNx1TtB38aQMX87b6GIDZIYh0gN5Z9939Z0qBjgoIXM3ZghZZDcKBS4CqpifJ
 BrvdGmo0
X-Proofpoint-GUID: BhDMSGV6yOaMr0zp-2Hk1PmiTkwi9zv3
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad7f39 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=b381tfKDLOYfEgrzl5gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BhDMSGV6yOaMr0zp-2Hk1PmiTkwi9zv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Tue, Aug 26, 2025 at 05:20:45PM +0800, Qianfeng Rong wrote:
> Change 'ret' from unsigned long to int, as storing negative error codes
> in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
> errors.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
