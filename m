Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7EC87989
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 01:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796D710E4C4;
	Wed, 26 Nov 2025 00:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzlJ7OOg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jo/TiJbj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516F510E4C1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:32:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHAiQD3890398
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J4iwvCXgi41ApZqHy6FaDdAC
 MQVq7RfPnZ/ycHIPWtQ=; b=IzlJ7OOgYhSqkKr3DVMnyJDXS+/ZecvljCzHkKg6
 y9wtWSE3Av+FdszfOJ2lvPOKjfQ6bZwL5A8GYTt3fllwlVqEsqdPTA36Pgh2+jDL
 OaK0pNk0CBPgfeRNvC5bgNyTdQYHkkLoMbF8AiDCsFK7TB2A9mDi2zI84eZiiuQ2
 JEB+E28wQn0RBM33aQZXGJg/fL6KYYP0IxotRmSvLPBaB3y9uwkOTIgEdGRxAoTM
 v75qzxVuin9s3rYUNQzpOy44HFfvgKAyLj5H+GEZeBVeXdzxdZdD7ImYflHM/cwV
 oMQKeV6OWQxhgskui18DNEpWJklA2VrxUsDAqiQx7R2qrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8ycy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:32:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e41884a0so1641926985a.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764117166; x=1764721966;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J4iwvCXgi41ApZqHy6FaDdACMQVq7RfPnZ/ycHIPWtQ=;
 b=jo/TiJbjHikW5AfZK2PJAl3dwlG8xtksKVlEphIOX6LLjcM9DgHyUMkg8nPZ0I1m0p
 u+jolro83MUeezTUa+p/rSO8hQ26x+IimTg/9o5/fFC6DZ95TJw8Ly9rm5ovxYn/troK
 uM3WehwgZxjiQeDCDTM1/XZCrm86iBieEHE2PXfH9JiyoryHVrRwz9SPyOpxv2N/C2FP
 B6A1eVSntDKPNzTA35OwhJct30OUKkU4gAaz+MEo3Wss9S2FXf1s349Mk/KR5/VqAe0Z
 p3Mt0PI0PN72JEwnIETVyr63FGit9EpQwot25G//RzceHokC/5xBKYrT1Ww8C3uLC2xm
 lnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764117166; x=1764721966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4iwvCXgi41ApZqHy6FaDdACMQVq7RfPnZ/ycHIPWtQ=;
 b=Awtg76VpnbMeyfmgeKoAQbinn7MpO4OqwITyKw9uU3GYndyJzzk3t8HTHMeyE1CzvF
 UJJAcx/Yhg4bac+EbfiO5MwwdSZJ6up5gcVoZ2lRD7GDfgDaGdt4TLcObkXz+dIUn6nN
 caVjgHd7E85dR7SZhvcB315I0nnCXOFwEWNX/hGfpQfPMfLuVcOCds6YCLE9HEZeiSih
 BLbAErc/aUj+JWpcDT67xe3D/h1UrbGUHTvqGNu7N7lqo6QNabgYurkgsu+YSTisi5tN
 XFIM1LWFtu9/ljUpyC/plxke5gEeN1JtNgNJ8uJSHE+cqWoGHEyXFjSXyTOpXCJA+YcB
 nihQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ0MYDNXxRIVWXXiXRDqNIRyTMFOaTd5QG0sct0gYa+woXA23uR39zkklqO/rwcreGt7vEb3HdwZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx22gdwAhwuH0DZYksp75WKgmm23Eb2gaObHs7hiwrzCspf5ord
 GAHHucIv1G+kS5AZW/PZRJyyYbUfDjSztbi0BLJGiG4I7Hej0EVNibWHs0BDQ7Tql1sN28O5ul9
 dAPm+WHTPVxUnvUa6suQ8fiVwM80uZuqtEEtny50J7Dn18Z3ljUR8Uq2mQn/2iGGhpE0rN2c=
X-Gm-Gg: ASbGncs1l16kTxM5wL+5ECTZdXPANQ/dsDU3H46pkr4KIkRUKsA4dFpu30LOJI/D+p/
 J5XWNryOKkFMKtOregvjKuKYe6MpYLdccBXppWRBt12MYAMDYFG5IhFqj+2WsrFdHu4S8tdkL04
 sB8TG2/N/P+pz9M/E9xlh3pg/7Eas7+BUsAAgzeVx3FnfUvSn7xLQpZhfpCGaklXfDLfp3UNj6s
 gcKELTaGlFxhSOALaBBzLaRVDr6540CoEVWc1vUl/ktnedQPXuH8cnjEAxGDA4osk3rUSBpgnl0
 clBFOaClq2W7ylIxAvRpj4GhXoKQ2L8of6G1b0QghhkAoF+faovtASG3/CLEDE7T5c03ksgCqWX
 9yCI2MDF5cVw24YQBHDa7CxXsbgwuMT3PjUJ8HlTz4oqldZBVVwbDObwy6SBx6lxRexaklZHG00
 m19C8xeLx+5t7cPsLGAkNY86I=
X-Received: by 2002:a05:620a:4015:b0:84b:76ba:9548 with SMTP id
 af79cd13be357-8b33d1fd268mr2309121585a.24.1764117165890; 
 Tue, 25 Nov 2025 16:32:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVWN0vGTHFY36fRR5GVlSOD+Z/Vc8pYyN2r9PKxfNBonDbJyyOvww5vLYOR9v7WXY6UEtXTQ==
X-Received: by 2002:a05:620a:4015:b0:84b:76ba:9548 with SMTP id
 af79cd13be357-8b33d1fd268mr2309118685a.24.1764117165475; 
 Tue, 25 Nov 2025 16:32:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbce0b2sm5555763e87.96.2025.11.25.16.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:32:44 -0800 (PST)
Date: Wed, 26 Nov 2025 02:32:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69264aae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VPnwEqdzcnHAo8jZfgIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfX3f5CKVNkDDdV
 NDYMmK2W1o/7LFQE4gHDz5zOzCtxzJet7Bh2+7Z91S8UFQEND6tofWQ0oq80vrttFb4/e5Xndj+
 kBZfoC4QG12BKEAkl+CBxLI73m4HoEVeOqT6YPnmulAgOBtra8tAK5iQ8LeQnHTKt9xZ2SRv2ZI
 ssGEmjiT399i9GS+83y8gcKVyy1gjgqxzDXomvUNMZzCAnMKKEQGo9HmZ9TxVFLEGBfUwTixit+
 WndKvZdys9/fJ2D0ZfK2W25ETFsQCN0WEYFEfZxZArl48W3qPK3viagHsaw9O6H0OuNH6Zbj5kt
 ZXvCE3CEeoqtjxiMFHlrM2JvnZ8Ljj9Pd8SLWBg3X32W78BKkIcCmVfMQ/O4uIQIMltHZMbYyIg
 gQcfys7XuEswcPO3POudSp0aOMuoxg==
X-Proofpoint-GUID: 5TG7ujNbQAt4M9y02EnV1htCb96mmEBr
X-Proofpoint-ORIG-GUID: 5TG7ujNbQAt4M9y02EnV1htCb96mmEBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260002
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

On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
> Add support for the merge3d block on sc7280 which will allow
> merge of streams coming from two layer mixers routed to single
> non DSC interface. This change helps to support larger buffer
> width which exceeds max_linewidth of 2400.

Please see Documentation/process/submitting-patches.rst.

First describe the issue that you observe, then describe steps required
for solving it.

> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

The patch LGTM.

-- 
With best wishes
Dmitry
