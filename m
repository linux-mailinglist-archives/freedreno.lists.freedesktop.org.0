Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDEAD08320
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 10:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317B710E857;
	Fri,  9 Jan 2026 09:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkuXLcFV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4giTUab";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7561710E857
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 09:29:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098W39p3214264
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 09:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rRpTpzQR8ExrbdL/F8XL9JZf
 0Q5dvO5YHpixCRZhmJ8=; b=LkuXLcFVJVGueu+PgdtFAUc8KLvOB4MDXyDRZDUt
 fgbw56l0wty9ZvEFcoyYO0c9CEpgKtdvciLPFOny4keFVgkY/OtNfTo4rww8/cVz
 xqeYdsprJGbxZfFB9bObGvjgP4R7evezj33MjETENm+Kg8zY8pllhOxpeds08pom
 t18LZsgGR49y3d4S+6jlONqTb7xTNAOrq0Kg3kl5/Mb1lb/5UnglI/Krdm3J9fTL
 iMkipS5bx7eLzqFi7XozK2vwmreK929gToAbIgJobfA1BnkJF8D8VarVdvw/PK2g
 lETjgihfnOanC/azuvf3KAUi+H6swQy7G0ptnsrvu4ptIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0hyrj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 09:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b234bae2a7so1070573285a.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 01:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767950990; x=1768555790;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
 b=W4giTUabW+nx9wM76Uu8kv0m3aEiWj3ndZVeAiI5byOHGpLHDtUhD5pvQfsO26UfLr
 MxtqbvINoTmUl6/Hh5vbP07KY0ZcmPIYPMa2iOaNrDaYL1xl07PoeIoTLDyMQhDmB0vQ
 eYInKXTcvsfRh37ywBcXvxLm5LMnXw1dmDw+TZGhtNflv4xrHYyNrbE9C1WuTfldcOTM
 650ZI8INIQxb/cSZyoLhP6t6NhSrXuFYsJyiaeaKSd+ookM6lgC1dvf/8MGE4Vd1hhRG
 0WdJwlFq/gh4selmIySax+9vNZhjAQ8Fhug6JYHCkmDBe9pVrkZJ3nyZpIPVjLrcM4aa
 CpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767950990; x=1768555790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
 b=l1plyJ+rv6Y2VGBRlCF3PWzj7ebTRQxkdcr9PprttStGZv0Mx68Q2uI5d3KgZaIFZ0
 UijqWiDeybFjnSbIHMvWUslPVhfou6VIsLPLjk9nBZwFOiZ47URJ4WBesi5kXpyDq1xW
 wHzGwDDNnpGWcKZIOlZNRyF4sIKWknY0QDw+9jmwhbwWYqpqBo0ge/MvRCqnM4l51Vou
 flhxyQaseTzI7qZJvpy2TAmYpfbJosMFOjOSVWGIOwFe0bfNGtIHZMC5HpAYdx8fCSUJ
 d32ClU63cSgGw8fRQp2L6c48mL2PTV4Gt1568Q2GUGfzwFZJiNWApR1BuApyT/P5gjY6
 APTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdOz3MhgN5AUpgzSXXP54Gb0HFNSMEpguM80Mrv0B9RNQTXGxFaWFpYvqRtWB67ki/otBuPWMZfuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0Ti8N5cYjqwP6Y+xv5PhYSGs2WW39od51OySgGElB/fCgbUdS
 s/kyfT962v2m578anXVRiFZYZasYBrFGOHtkUmd2yVP6EagGKewnLl40NXlJrkJZwJABLYgLhKS
 nJapHeL0K8axAQMYiRLDfvzHKPSOy7fpJlcWMFjKbOZ6Gr9de2639TZrydy0SlLUUe4ka7yo=
X-Gm-Gg: AY/fxX5b7D9rPk2V0mICSnJla5fG1Yo+1afa3xq88xzNXGid7Y06tihLgYj8bYyWz0/
 amAq/u5m+2M7+fcYmHi6M2QdbSxjprnyfU4JpbrJ1UHweEMht/u5lEVizPztihkcR0uFq3wgqlc
 k2dzULfUROQy5YXxTkXNI5SQMkqO7sKGvzNdugc/sQSg2KncE3b9J2Y/73MGwISr5NckR5aMy3Y
 MK6E17Gm8M+av85rrsF23dNGyMi1SdxlT9tnbdEbAAfBVJTzH4o/3f/aIze0dZgJtarnzia/w9O
 luMJKOHxRewBJu85YqegambGfg/9kVfy68ndpE9QtksKcNArQDKlyIxvEaHawMcHEJgRIcWMFih
 9bAK4firvFC3CJw0nJFsH
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id
 af79cd13be357-8c38939254amr1257045285a.28.1767950989813; 
 Fri, 09 Jan 2026 01:29:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXoLCG5LO6zefGjgD+xKyAVNrDH56nL2+22oLiyLggqcBqmC9ow0fJTq3cPgpQOVlQjcJAWA==
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id
 af79cd13be357-8c38939254amr1257042385a.28.1767950989227; 
 Fri, 09 Jan 2026 01:29:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d029bsm1076667766b.41.2026.01.09.01.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 01:29:48 -0800 (PST)
Date: Fri, 9 Jan 2026 11:29:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <7t7ctq5vasottsmiuvo6zwqsnlcocc3c72fno7qlhgeqhmhxid@5tsjevpuobty>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
X-Proofpoint-GUID: 1AlngrUQgRwhWq1hbkuyZGXYsYX3_6hL
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960ca8e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1AlngrUQgRwhWq1hbkuyZGXYsYX3_6hL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX8iPKA4sCgy0v
 oKlp+itWhTxNsbkVlu/EI+Kj7kX+e3tAAsBRMKuyQRMdUSBfPpXaw/X2OLV8E4PO2NT7Es0mPfY
 LOV/a6k9hWgIrLno0m9iM67uAue412uEzZXHl3ExATCGsL/ntMAhEwnBDqnHSVhOJNDLRtZkSml
 j6JN3nOa7LS74xJvfEhvIPbNt4BB4rYU8aH1fbJ9FLHgUQSiGpeNrsGNMDUzfyXFE1X1rdvsodW
 KXnE2mCawAXiVotJBFKwjen35WQ8N3VpGCOoRBgJicSNmpFYWy/AYYK53P85i/ZmuMFOYZIEQod
 rR99uL5jpLSHpcDwWewLlC1wFDp60wDr88IwREfW1Sr9aE1zfD9sUq31M25aRAG+YE5CIbVunTr
 nZqxsE3qKwSDwxIcGMcZnNWRUfKGN9eqUIHM09NvdYFtPzlNx9GWmIrtzyV8MtcEq4rE/wkrUeS
 SjVGoknVAgHZ9ozYNag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065
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

On 26-01-08 16:16:42, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
